import '../../integrations/supabase/supabase_client.dart';

class UserRepository {
  /*
  *
  * TODO test this method
  * Insert new user data into the custom 'users' table
  *
  * */
  Future<void> insertUserData({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
  }) async {
    try {
      final response = await supabase.client.from('users').insert({
        'id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'role': 'user', // default role
      });

      if (response.error != null) {
        throw Exception(
            'Error inserting user data: ${response.error!.message}');
      }
    } catch (e) {
      throw Exception('Failed to insert user data: $e');
    }
  }

  /*
  *
  * TODO test this method
  * Fetch user data from the 'users' table based on user ID
  *
  * */
  Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    try {
      final response = await supabase.client
          .from('users')
          .select()
          .eq('id', userId)
          .single();
      return response;
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}
