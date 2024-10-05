import 'package:supabase_flutter/supabase_flutter.dart';

late Supabase supabase;

class SupabaseService {
  final supabase = Supabase.instance.client;
}
