import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartItem {
  final String productId;
  final String productName;
  final int price;
  final int quantity;
  final String imageUrl;
  final String sellerId;
  final String sellerName;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.sellerId,
    required this.sellerName,
  });

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'price': price,
        'quantity': quantity,
        'imageUrl': imageUrl,
        'sellerId': sellerId,
        'sellerName': sellerName,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json['productId'],
        productName: json['productName'],
        price: json['price'],
        quantity: json['quantity'],
        imageUrl: json['imageUrl'],
        sellerId: json['sellerId'],
        sellerName: json['sellerName'],
      );
}

class CartService extends ChangeNotifier {
  List<CartItem> _items = [];
  static const String _storageKey = 'cart_items';

  List<CartItem> get items => _items;
  
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  
  int get totalPrice => _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  /// Initialize cart from storage
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString(_storageKey);
    
    if (cartData != null) {
      try {
        final List<dynamic> decoded = jsonDecode(cartData);
        _items = decoded.map((item) => CartItem.fromJson(item)).toList();
        notifyListeners();
      } catch (e) {
        debugPrint('Error loading cart: $e');
      }
    }
  }

  /// Save cart to storage
  Future<void> _saveCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = jsonEncode(_items.map((item) => item.toJson()).toList());
      await prefs.setString(_storageKey, cartData);
    } catch (e) {
      debugPrint('Error saving cart: $e');
    }
  }

  /// Add item to cart
  Future<void> addItem({
    required String productId,
    required String productName,
    required int price,
    required String imageUrl,
    required String sellerId,
    required String sellerName,
    int quantity = 1,
  }) async {
    final existingIndex = _items.indexWhere((item) => item.productId == productId);
    
    if (existingIndex >= 0) {
      // Update quantity jika produk sudah ada
      _items[existingIndex] = CartItem(
        productId: productId,
        productName: productName,
        price: price,
        imageUrl: imageUrl,
        sellerId: sellerId,
        sellerName: sellerName,
        quantity: _items[existingIndex].quantity + quantity,
      );
    } else {
      // Tambah produk baru
      _items.add(CartItem(
        productId: productId,
        productName: productName,
        price: price,
        imageUrl: imageUrl,
        sellerId: sellerId,
        sellerName: sellerName,
        quantity: quantity,
      ));
    }
    
    await _saveCart();
    notifyListeners();
  }

  /// Update quantity
  Future<void> updateQuantity(String productId, int newQuantity) async {
    if (newQuantity <= 0) {
      await removeItem(productId);
      return;
    }
    
    final index = _items.indexWhere((item) => item.productId == productId);
    if (index >= 0) {
      _items[index] = CartItem(
        productId: _items[index].productId,
        productName: _items[index].productName,
        price: _items[index].price,
        imageUrl: _items[index].imageUrl,
        sellerId: _items[index].sellerId,
        sellerName: _items[index].sellerName,
        quantity: newQuantity,
      );
      
      await _saveCart();
      notifyListeners();
    }
  }

  /// Remove item from cart
  Future<void> removeItem(String productId) async {
    _items.removeWhere((item) => item.productId == productId);
    await _saveCart();
    notifyListeners();
  }

  /// Clear all items
  Future<void> clear() async {
    _items.clear();
    await _saveCart();
    notifyListeners();
  }

  /// Get item by product ID
  CartItem? getItem(String productId) {
    try {
      return _items.firstWhere((item) => item.productId == productId);
    } catch (e) {
      return null;
    }
  }
}
