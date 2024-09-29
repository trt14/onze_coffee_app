import 'package:supabase_flutter/supabase_flutter.dart';
import '../../integrations/supabase/supabase_client.dart';

class AuthRepository {
  // Supabase client instance

  /*
  *
  * TODO need testing
  * Sign up a new user using Supabase Auth
  *
  * */
  Future<bool> signUp(String email, String password) async {
    try {
      print("create account inside try");

      await supabase.client.auth.signInWithOtp(email: email);
      return true;
    } catch (e) {
      throw Exception('Error during sign-up: $e');
    }
  }

  Future<String> verifyOtp({required String email, required String otp}) async {
    try {
      await supabase.client.auth
          .verifyOTP(type: OtpType.signup, email: email, token: otp);
      return "Correct otp";
    } catch (e) {
      print(e.toString());
      return "Something error $e";
    }
  }
  /*
  *
  * TODO need testing
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
