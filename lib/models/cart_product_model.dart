import 'package:onze_coffee_app/models/product_model.dart';

class CartProductModel {
  final String productName;
  final String tempreture;
  final int quantity;

  CartProductModel({
    required this.productName,
    required this.tempreture,
    required this.quantity,
  });

  factory CartProductModel.fromProductModel({
    required ProductModel product,
    required int quantity,
  }) {
    return CartProductModel(
      productName: product.productName,
      tempreture: product.tempreture,
      quantity: quantity,
    );
  }

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productName: json['product_name'],
      tempreture: json['tempreture'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_name': productName,
      'tempreture': tempreture,
      'quantity': quantity,
    };
  }
}