import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';
import 'package:onze_coffee_app/models/user_model.dart';
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
  String getCurrentUser() {
    return supabase.client.auth.currentUser?.email ?? "";
  }

  Future loginToken({required String email}) async {
    try {
      await Future.delayed(Duration.zero);
      // Return the auth response if OTP verification is successful
      // supabase.client.accessToken;

      final data =
          await supabase.client.from("users").select("*").eq("email", email);
      GetIt.I.get<UserLayer>().user = UserModel.fromJson(data.first);
      return true;
    } on PostgrestException {
      throw Exception('Error inserting user data');
    } on AuthException {
      throw Exception('Error during OTP verification');
    } catch (e) {
      throw Exception('Error during OTP verification: $e');
    }
  }

  Future<void> signUp(
      {required String email,
      required String fName,
      required String lName,
      required String phoneNumber}) async {
    try {
      // Sign up with email to send an email verification OTP
      final response = await supabase.client.auth
          .signUp(email: email, password: "dsfdsafdaf432412");

      final user = response.user;
      if (user != null) {
        await supabase.client.from('users').insert({
          'id': user.id,
          'email': user.email,
          'first_name': fName,
          'last_name': lName,
          'phone': phoneNumber,
          'created_at': DateTime.now().toIso8601String(),
        });
      }
    } on AuthException {
      // Handle Supabase Auth-related exceptions
      throw Exception('error during sign up email does not exit');
    } on PostgrestException {
      // Handle Supabase PostgREST API-related exceptions
      throw Exception('can not connect to server');
    } catch (e) {
      // Handle any other exceptions
      // throw Exception('Error during sign up: $e');
    }
  }

  Future login({required String email}) async {
    try {
      await supabase.client.auth.signInWithOtp(email: email);

      return true;
    } on AuthException {
      return false;
    }
  }

  /*
  *
  * Sign in using email and otp
  *
  * TODO replace logs after successful with throw Exception statements

  * */
  Future verifyOtp(
      {required String email, required String otp, required int type}) async {
    try {
      await Future.delayed(Duration.zero);
      // Return the auth response if OTP verification is successful
      if (type == 0) {
        await supabase.client.auth
            .verifyOTP(type: OtpType.email, email: email, token: otp);
      } else {
        await supabase.client.auth
            .verifyOTP(type: OtpType.signup, email: email, token: otp);
      }
      final data =
          await supabase.client.from("users").select("*").eq("email", email);
      GetIt.I.get<UserLayer>().user = UserModel.fromJson(data.first);
      return true;
    } on PostgrestException {
      throw Exception('Error inserting user data');
    } on AuthException {
      throw Exception('Error during OTP verification');
    } catch (e) {
      throw Exception('Error during OTP verification: $e');
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
      await supabase.client.auth.signOut();
    } catch (e) {
      throw Exception('Error during sign-out');
    }
  }
}
