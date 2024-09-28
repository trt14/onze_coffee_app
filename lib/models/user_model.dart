import 'package:supabase_flutter/supabase_flutter.dart';

// TODO need to test this class
class UserModel {

  // TODO Check all columns in the 'users' table
  final String id; // Unique identifier
  final String? email; // Email of the user
  final String? phone; // Phone number of the user
  final String? createdAt; // Creation date
  final String? lastSignInAt; // Last sign-in date
  final String? role; // Custom role, stored in user_metadata

  UserModel({
    required this.id,
    this.email,
    this.phone,
    this.createdAt,
    this.lastSignInAt,
    this.role,
  });

  /*
  *
  * Converts Supabase `User` object to `UserModel`
  *
  * */
  factory UserModel.fromSupabase(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      phone: user.phone,
      createdAt: user.createdAt,
      lastSignInAt: user.lastSignInAt,
      role: user.role, // Extracts role from user metadata
    );
  }

  /*
  *
  * Converts UserModel to JSON map (for storage or API calls)
  *
  * */
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'createdAt': createdAt,
      'lastSignInAt': lastSignInAt,
      'role': role,
    };
  }

  /*
  *
  * Creates UserModel from a JSON map (e.g., after retrieving from API)
  *
  * */
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      createdAt: json['createdAt'],
      lastSignInAt: json['lastSignInAt'],
      role: json['role'],
    );
  }
}
