import 'package:onze_coffee_app/models/produc_bill_model.dart';

class BillModel {
  BillModel(
      {required this.billId,
      required this.status,
      required this.note,
      required this.createdAt,
      required this.userId,
      required this.products,
      required this.totalPrice});
  late final int billId;
  late final String status;
  late final String note;
  late final String createdAt;
  late final String userId;
  late final num totalPrice;
  late final List<ProductBillModel> products;

  BillModel.fromJson(Map<String, dynamic> json) {
    billId = json['bill_id'] ?? 0;
    status = json['status'] ?? "";
    note = json['note'] ?? "";
    totalPrice = json["total_price"] ?? 0.0;
    createdAt = json['created_at'] ?? "";
    userId = json['user_id'] ?? "";
    products = List.from(json['products'])
        .map((e) => ProductBillModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bill_id'] = billId;
    data['status'] = status;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['user_id'] = userId;
    data["total_price"] = totalPrice;
    data['products'] = products.map((e) => e.toJson()).toList();
    return data;
  }
}
