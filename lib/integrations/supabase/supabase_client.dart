import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

late Supabase supabase;

class SupabaseService {
  // static final SupabaseService _instance = SupabaseService._internal();

  // factory SupabaseService() {
  //   return _instance;
  // }

  // SupabaseService._internal();

  final supabase = Supabase.instance.client;

  SupabaseClient get client => Supabase.instance.client;
}
