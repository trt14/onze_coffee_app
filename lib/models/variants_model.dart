class VariantsModel {
  VariantsModel({
    required this.size,
    required this.price,
    required this.calories,
  });
  late final String size;
  late final int price;
  late final int calories;

  VariantsModel.fromJson(Map<String, dynamic> json) {
    size = json['size'] ?? "";
    price = json['price'] ?? 0;
    calories = json['calories'] ?? 0;
  }

  Map<String, dynamic> toJson({required int productId}) {
    final data = <String, dynamic>{};
    data["product_id"] = productId;
    data['size'] = size;
    data['price'] = price;
    data['calories'] = calories;
    return data;
  }
}
