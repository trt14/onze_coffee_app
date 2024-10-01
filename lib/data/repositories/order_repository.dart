import 'package:flutter/material.dart';
import 'package:onze_coffee_app/models/bill_model.dart';

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
  addNewOrderID({required String userID, required double amount}) async {
    try {
      final response = await supabase.client.from("orders").insert({
        "user_id": userID,
        "total_price": amount,
        "status": "not-complete"
      }).select();
      print(response);
      return response.first["id"];
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
        "product_id": productID,
        "created_by": userID,
        "order_id": orderID
      }).select();
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }

  getProductVarient({required int productID}) async {
    try {
      final response = await supabase.client
          .from("product_variants")
          .select("id")
          .eq("product_id", productID)
          .select();
      print(response.first);
      return response.first["id"];
    } catch (e) {
      print(e);
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
  getEmployeeBill() async {
    print("Iam at getEmployeeOrder");
    try {
      final List<Map<String, dynamic>> data =
          await supabase.client.rpc("get_order_details_v1");
      return data.map((element) => BillModel.fromJson(element)).toList();
    } catch (e) {
      print(e);
    }
  }

  getBill(int id) async {
    print("Iam at getEmployeeOrder");
    try {
      final List<Map<String, dynamic>> data = await supabase.client
          .rpc("get_order_details_by_id", params: {"user_order": id});

      return BillModel.fromJson(data.first);
    } catch (e) {
      print(e);
    }
  }

  getOrderByStatus(String status) async {
    print("Iam at getOrderByStatus");
    try {
      final List<Map<String, dynamic>> data = await supabase.client
          .rpc("get_order_details_by_status", params: {"order_status": status});
      return data.map((element) => BillModel.fromJson(element)).toList();
    } catch (e) {
      print(e);
    }
  }
}
