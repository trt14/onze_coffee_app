import 'package:onze_coffee_app/models/variants.dart';

class ProductModel {
  ProductModel({
    required this.productId,
    required this.productName,
    this.description,
    required this.tempreture,
    required this.variants,
    required this.productCategory,
    required this.imageUrls,
  });
  late final int productId;
  late final String productName;
  late final Null description;
  late final String tempreture;
  late final List<Variants> variants;
  late final String productCategory;
  late final List<String> imageUrls;

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['id'];
    productName = json['name'] ?? "";
    description = json["description"] ?? '';
    tempreture = json['tempreture'] ?? "";
    variants =
        List.from(json['variants']).map((e) => Variants.fromJson(e)).toList();
    productCategory = json['product_category'];
    imageUrls = List.castFrom<dynamic, String>(json['image_urls']);
  }

  Map<String, dynamic> toJson({required int categoryId}) {
    final data = <String, dynamic>{};
    data['name'] = productName;
    data['description'] = description;
    data['tempreture'] = tempreture;
    data["category_id"] = categoryId;

    return data;
  }
}
// 