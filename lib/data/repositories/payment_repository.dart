import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';

class PaymentRepository {
  /*
  *
  * Tested
  * Add new Payment
  *
  * */
  addNewPayment(
      {required String userID,
      required String paymentMethod,
      required String paymentStatus,
      required int orderID,
      required String transactionID,
      required double amount}) async {
    try {
      final response = await supabase.client.from("payments").insert({
        "order_id": orderID,
        "created_by": userID,
        "amount": amount,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "transaction_id": transactionID,
      }).select();
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }
}
