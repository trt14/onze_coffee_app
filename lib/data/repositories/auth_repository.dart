import 'dart:developer';

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
  Future<void> signUp(
      {required String email,
      required String fName,
      required String lName,
      required String phoneNumber}) async {
    print("iam at sign up supabase function");
    try {
      // Sign up with email to send an email verification OTP
      final response = await supabase.client.auth
          .signUp(email: email, password: "dsfdsafdaf432412");

      final user = response.user;
      print("create user in auth table");
      if (user != null) {
        print("create user in public user");
        await supabase.client.from('users').insert({
          'id': user.id,
          'email': user.email,
          'first_name': fName,
          'last_name': lName,
          'phone': phoneNumber,
          'created_at': DateTime.now().toIso8601String(),
        });
      }
      print("done");
      print('User signed up with email verification OTP');
      login(email: email);
    } on AuthException catch (e) {
      // Handle Supabase Auth-related exceptions
      print('AuthException error during sign up: ${e.message}');
      throw Exception('error during sign up email does not exit');
    } on PostgrestException catch (e) {
      // Handle Supabase PostgREST API-related exceptions
      print(e);
      throw Exception('can not connect to server');
    } catch (e) {
      // Handle any other exceptions
      print('Error during sign up: $e');
      // throw Exception('Error during sign up: $e');
    }
  }

  Future login({required String email}) async {
    print("iam at login supabase");
    try {
      await supabase.client.auth.signInWithOtp(email: email);

      return true;
    } on AuthException catch (e) {
      print('AuthException during OTP verification: ${e.message}');
      print(e.toString());
      throw Exception('Error during OTP verification');
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  /*
  *
  * Sign in using email and otp
  *
  * TODO replace logs after successful with throw Exception statements

  * */
  Future verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await Future.delayed(Duration.zero);
      // Return the auth response if OTP verification is successful
      print("iam at verifyOtp");
      await supabase.client.auth
          .verifyOTP(type: OtpType.email, email: email, token: otp);
      print("get user data");
      final data =
          await supabase.client.from("users").select("*").eq("email", email);
      print("print user data after login");
      print(data);
      GetIt.I.get<UserLayer>().user = UserModel.fromJson(data.first);
      print("user in singalton after login");
      print(GetIt.I.get<UserLayer>().user.id);
      print("return true");
      return true;
    } on PostgrestException catch (e) {
      print('Error inserting user data: ${e.message}');
      throw Exception('Error inserting user data');
    } on AuthException catch (e) {
      print('AuthException during OTP verification: ${e.message}');
      print('email : $email, otp : $otp');
      print(e.toString());
      throw Exception('Error during OTP verification');
    } catch (e) {
      print('Error during OTP verification: $e');
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
      throw Exception('Error during sign-out: $e');
    }
  }
}
