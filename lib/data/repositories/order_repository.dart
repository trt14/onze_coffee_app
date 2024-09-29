import 'package:supabase_flutter/supabase_flutter.dart';
import '../../integrations/supabase/supabase_client.dart';

class OrderRepository {
  // Supabase client instance
  // final SupabaseClient _supabase = SupabaseService().client;

  /*
  *
  * Tested
  * Add new Order
  *
  * */
  addNewOrderID({required String userID}) async {
    try {
      final response = await supabase.client.from("orders").insert({
        "user_id": userID,
        "total_price": 0,
        "status": "not-complete"
      }).select();
      print(response);
      addOrderItem(
          userID: userID,
          price: 12.5,
          quantity: 3,
          productID: 1,
          orderID: response.first["id"]);
    } catch (e) {
      print(e.toString());
    }
  }

  /*
  *
  * Tested
  * update  Order
  *
  * */
  updateOrderID(
      {required String userID,
      required double amount,
      required String status,
      required int orderID}) async {
    try {
      final response = await supabase.client
          .from("orders")
          .update({
            "user_id": userID,
            "total_price": amount,
            "status": status,
            "updated_by": userID
          })
          .eq("id", orderID)
          .select();
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }

  /*
  *
  * Tested
  * add new Order Item
  *
  * */

  addOrderItem(
      {required String userID,
      required double price,
      required int orderID,
      required int quantity,
      required int productID}) async {
    try {
      final response = await supabase.client.from("order_items").insert({
        "quantity": quantity,
        "price": price,
        "product_id": 1,
        "created_by": userID,
        "order_id": orderID
      }).select();
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }

  /*
  *
  * 
  * Update Order Item
  *
  * */

  updateOrderItem(
      {required String userID,
      required int orderItemID,
      required double price,
      required int orderID,
      required int quantity,
      required int productID}) async {
    try {
      final response = await supabase.client.from("order_items").update({
        "quantity": quantity,
        "price": price,
        "product_id": 1,
        "created_by": userID,
        "order_id": orderID
      }).eq("id", orderItemID);
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }

  /*
  *
  * Tested
  * Delete Category
  *
  * */

  /*
  *
  * Tested
  * get all Categories
  *
  * */
}
