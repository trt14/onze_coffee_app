// TODO need to test this class
class UserModel {
  // TODO Check all columns in the 'users' table
  late final String id; // Unique identifier
  late final String email; // Email of the user
  late final String phone; // Phone number of the user
  late final String role; // Custom role, stored in user_metadata

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'role': role,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      role: json['role'] ?? "",
    );
  }
}
