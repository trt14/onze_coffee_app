class ProductBillModel {
  ProductBillModel({
    required this.id,
    required this.qty,
    required this.name,
    required this.size,
    required this.price,
    required this.calories,
  });
  late final int id;
  late final int qty;
  late final String name;
  late final String size;
  late final num price;
  late final int calories;

  ProductBillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    qty = json['qty'] ?? 0;
    name = json['name'] ?? "";
    size = json['size'] ?? "";
    price = json['price'] ?? 0;
    calories = json['calories'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['qty'] = qty;
    data['name'] = name;
    data['size'] = size;
    data['price'] = price;
    data['calories'] = calories;
    return data;
  }
}
