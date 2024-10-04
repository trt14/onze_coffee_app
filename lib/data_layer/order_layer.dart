import 'package:onze_coffee_app/models/bill_model.dart';

class OrderLayer {

  List<BillModel> orders = [];
    List<String> orderStatus = ["hold", "accepted", "completed"];
  int index = 0;
}