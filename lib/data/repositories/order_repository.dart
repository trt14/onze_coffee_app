import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data_layer/order_layer.dart';
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
      return response.first["id"];
    } catch (e) {}
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
      await supabase.client
          .from("orders")
          .update({
            "user_id": userID,
            "total_price": amount,
            "status": status,
            "updated_by": userID
          })
          .eq("id", orderID)
          .select();
    } catch (e) {}
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
      await supabase.client.from("order_items").insert({
        "quantity": quantity,
        "price": price,
        "product_id": productID,
        "created_by": userID,
        "order_id": orderID
      }).select();
    } catch (e) {}
  }

  getProductVarient({required int productID}) async {
    try {
      final response = await supabase.client
          .from("product_variants")
          .select("id")
          .eq("product_id", productID)
          .select();
      return response.first["id"];
    } catch (e) {}
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
    try {
      final List<Map<String, dynamic>> data =
          await supabase.client.rpc("get_order_details_v1");
      return data.map((element) => BillModel.fromJson(element)).toList();
    } catch (e) {}
  }

  getUserBill({required String id}) async {
    try {
      final List<Map<String, dynamic>> data = await supabase.client
          .rpc("get_order_details_by_user_id", params: {"user_uuid": id});
      return data.map((element) => BillModel.fromJson(element)).toList();
    } catch (e) {}
  }

  getBill(int id) async {
    try {
      final List<Map<String, dynamic>> data = await supabase.client
          .rpc("get_order_details_by_id", params: {"user_order": id});

      return BillModel.fromJson(data.first);
    } catch (e) {}
  }

  Stream<List<Map<String, dynamic>>>? getNewStatus(int id) {
    try {
      final response = supabase.client
          .from("orders")
          .stream(primaryKey: ["id"]).eq("id", id);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  getOrderByStatus(String status) async {
    try {
      List<Map<String, dynamic>> data = await supabase.client
          .rpc("get_order_details_by_status", params: {"order_status": status});
      data = data.reversed.toList();
      GetIt.I.get<OrderLayer>().orders =
          data.map((element) => BillModel.fromJson(element)).toList();
    } catch (e) {}
  }

  updateOrderStatus({required int id, required String status}) async {
    try {
      await supabase.client
          .from("orders")
          .update({"status": status}).eq("id", id);
    } catch (e) {}
  }

  Future getOrderById(int id) async {
    await Future.delayed(Duration.zero);

    try {
      final data = await supabase.client
          .rpc("get_order_details_by_id", params: {"user_order": id});
      return BillModel.fromJson(data.first);
    } catch (e) {}
  }
}
