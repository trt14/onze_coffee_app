import 'package:supabase_flutter/supabase_flutter.dart';
import '../../integrations/supabase/supabase_client.dart';

class AuthRepository {
  // Supabase client instance

  /*
  *
  * Sign up a new user using Supabase Auth
  *
  * If Confirm email is enabled, a user is returned but session is null.
  * If Confirm email is disabled, both a user and a session are returned.
  *
  * */
  Future<AuthResponse> signUp(String email, String password) async {
    try {
      // Return the user and session if Confirm email is enabled
      return await supabase.client.auth.signUp(email: email, password: password);
    } catch (e) {
      throw Exception('Error during sign-up: $e');
    }
  }

  /*
  *
  * Sign in using email and otp
  *
  * */
  Future<AuthResponse> verifyOtp({required String email, required String otp}) async {
    try {
      // Return the auth response if otp verification is successful
      return await supabase.client.auth
          .verifyOTP(type: OtpType.signup, email: email, token: otp);
    } catch (e) {
      throw Exception('Error during OTP verification: $e');
    }
  }

  /*
  *
  * Sign in an existing user
  *
  * */
  // Future<User?> signIn(String email) async {
  //   try {
  //     final response = await supabase.client.auth.signInWithOtp(email: email);

  //     if (response!= null) {
  //       // Successfully signed in, return the user object
  //       return response.user;
  //     } else {
  //       throw Exception('Sign-in failed');
  //     }
  //   } catch (e) {
  //     throw Exception('Error during sign-in: $e');
  //   }
  // }

  /*
  *
  * TODO need testing
  * Sign out the current user
  *
  * */
  Future<void> signOut() async {
    try {
      await supabase.client.auth.signOut();
    } catch (e) {
      throw Exception('Error during sign-out: $e');
    }
  }
}
