class ProfileModels {
  final String isUpdate;
  final bool error;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String username;

  ProfileModels({
    required this.isUpdate,
    required this.error,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.username,
  });

  factory ProfileModels.fromJson(Map<String, dynamic> json) {
    return ProfileModels(
      isUpdate: json['is_update']?.toString() ?? '0',
      error: json['error'] ?? false,
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phoneNumber: json['phone_number']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_update': isUpdate,
      'error': error,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'username': username,
    };
  }
}