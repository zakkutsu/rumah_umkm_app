class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role; // 'guest', 'customer', 'seller'
  final String? storeName;
  final String? storeCategory;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.storeName,
    this.storeCategory,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'storeName': storeName,
      'storeCategory': storeCategory,
    };
  }

  // Create from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      storeName: json['storeName'],
      storeCategory: json['storeCategory'],
    );
  }

  // Guest user (default)
  factory UserModel.guest() {
    return UserModel(
      id: '',
      name: 'Guest',
      email: '',
      phone: '',
      role: 'guest',
    );
  }

  bool get isGuest => role == 'guest';
  bool get isCustomer => role == 'customer';
  bool get isSeller => role == 'seller';
}
