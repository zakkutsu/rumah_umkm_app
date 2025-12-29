import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  UserModel _currentUser = UserModel.guest();
  bool _isLoading = false;

  UserModel get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => !_currentUser.isGuest;

  // Initialize - Load user from storage
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    
    if (userJson != null) {
      try {
        _currentUser = UserModel.fromJson(json.decode(userJson));
      } catch (e) {
        _currentUser = UserModel.guest();
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  // Login (Dummy - nanti replace dengan API)
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Dummy validation
    if (email.isNotEmpty && password.length >= 6) {
      _currentUser = UserModel(
        id: '1',
        name: 'Budi Santoso',
        email: email,
        phone: '+62 812 3456 7890',
        role: 'customer',
      );

      // Save to storage
      await _saveUser();

      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Register (Dummy - nanti replace dengan API)
  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Dummy validation
    if (email.isNotEmpty && password.length >= 6) {
      _currentUser = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        phone: phone,
        role: 'customer',
      );

      // Save to storage
      await _saveUser();

      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Upgrade to Seller
  Future<bool> upgradeToSeller({
    required String storeName,
    required String storeCategory,
  }) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _currentUser = UserModel(
      id: _currentUser.id,
      name: _currentUser.name,
      email: _currentUser.email,
      phone: _currentUser.phone,
      role: 'seller',
      storeName: storeName,
      storeCategory: storeCategory,
    );

    // Save to storage
    await _saveUser();

    _isLoading = false;
    notifyListeners();
    return true;
  }

  // Logout
  Future<void> logout() async {
    _currentUser = UserModel.guest();
    
    // Clear storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    
    notifyListeners();
  }

  // Save user to storage
  Future<void> _saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(_currentUser.toJson()));
  }
}
