import 'package:supabase_flutter/supabase_flutter.dart';

late Supabase supabase;

class SupabaseService {
  // static final SupabaseService _instance = SupabaseService._internal();

  // factory SupabaseService() {
  //   return _instance;
  // }

  // SupabaseService._internal();

  final supabase = Supabase.instance.client;
}
