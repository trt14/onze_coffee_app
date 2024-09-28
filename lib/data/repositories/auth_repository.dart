import 'package:supabase_flutter/supabase_flutter.dart';
import '../../integrations/supabase/supabase_client.dart';

class AuthRepository {
  // Supabase client instance
  final SupabaseClient _supabase = SupabaseService().client;

  /*
  *
  * TODO need testing
  * Sign up a new user using Supabase Auth
  *
  * */
  Future<User?> signUp(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Successfully signed up, return the user object
        return response.user;
      } else {
        throw Exception('Sign-up failed');
      }
    } catch (e) {
      throw Exception('Error during sign-up: $e');
    }
  }

  /*
  *
  * TODO need testing
  * Sign in an existing user
  *
  * */
  Future<User?> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Successfully signed in, return the user object
        return response.user;
      } else {
        throw Exception('Sign-in failed');
      }
    } catch (e) {
      throw Exception('Error during sign-in: $e');
    }
  }

  /*
  *
  * TODO need testing
  * Sign out the current user
  *
  * */
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw Exception('Error during sign-out: $e');
    }
  }
}
