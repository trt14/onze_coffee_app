import 'package:supabase_flutter/supabase_flutter.dart';
import '../../integrations/supabase/supabase_client.dart';

class CategoryRepository {
  // Supabase client instance
  // final SupabaseClient _supabase = SupabaseService().client;

  /*
  *
  * 
  * Add new Category
  *
  * */
  addNewCategory({required String name}) async {
    try {
      final dataFound = await supabase.client
          .from("categories")
          .select("*")
          .match({"name": name}).select();

      if (dataFound.isNotEmpty) {
        print("there is data");
      } else {
        final response =
            await supabase.client.from("categories").upsert({"name": name});
        print(response);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /*
  *
  * 
  * Update Category
  *
  * */

  updateCategory({required int id, required String name}) async {
    try {
      final dataFound = await supabase.client
          .from("categories")
          .select("*")
          .match({"name": name}).select();
      if (dataFound.isNotEmpty) {
        print("there is data");
      } else {
        final response = await supabase.client
            .from("categories")
            .update({"name": name}).eq("id", id);
        print(response);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /*
  *
  * 
  * Delete Category
  *
  * */

  deleteCategory({required int id}) async {
    try {
      final dataFound = await supabase.client
          .from("products")
          .select("*")
          .eq("category_id", id)
          .select();

      if (dataFound.isNotEmpty) {
        print("there is data");
      } else {
        final response = await supabase.client
            .from("categories")
            .delete()
            .eq("id", id)
            .select();
      }
    } catch (e) {
      print(e.toString());
    }
  }


}
