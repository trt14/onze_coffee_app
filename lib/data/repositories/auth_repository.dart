import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../../integrations/supabase/supabase_client.dart';

class AuthRepository {
  // Supabase client instance

  /*
  *
  * Sign up a new user using Supabase Auth with throw Exception statements
  *
  * TODO replace logs after successful sign up with
  * */
  Future<void> signUp({required String email}) async {
    try {
      // Sign up with email to send an email verification OTP
      await supabase.client.auth.signInWithOtp(email: email);
      log('User signed up with email verification OTP');
    } on AuthException catch (e) {
      // Handle Supabase Auth-related exceptions
      log('AuthException error during sign up: ${e.message}');
      // throw Exception('AuthException error during sign up: ${e.message}');
    } on PostgrestException catch (e) {
      // Handle Supabase PostgREST API-related exceptions
      log('PostgrestException error during sign up: ${e.message}');
      // throw Exception('PostgrestException error during sign up: ${e.message}');
    } catch (e) {
      // Handle any other exceptions
      log('Error during sign up: $e');
      // throw Exception('Error during sign up: $e');
    }
  }

  /*
  *
  * Sign in using email and otp
  *
  * TODO replace logs after successful with throw Exception statements

  * */
  Future<AuthResponse> verifyOtp(
      {required String email, required String otp}) async {
    try {
      // Return the auth response if OTP verification is successful
      final AuthResponse response = await supabase.client.auth
          .verifyOTP(type: OtpType.signup, email: email, token: otp);

      // If the user is not null, create a user data entry in the 'users' table
      final user = response.user;
      if (user != null) {
        await supabase.client.from('users').insert({
          'id': user.id,
          'email': user.email,
          'created_at': DateTime.now().toIso8601String(),
        });
      }

      // return the auth response
      return response;
    } on PostgrestException catch (e) {
      log('Error inserting user data: ${e.message}');
      throw Exception('Error inserting user data: ${e.message}');
    } on AuthException catch (e) {
      log('AuthException during OTP verification: ${e.message}');
      log('email : $email, otp : $otp');
      log(e.toString());
      throw Exception('AuthException during OTP verification: ${e.message}');
    } catch (e) {
      log('Error during OTP verification: $e');
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
