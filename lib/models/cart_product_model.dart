import 'package:onze_coffee_app/models/product_model.dart';
import 'package:onze_coffee_app/models/variants_model.dart';

class CartProductModel {
  final String productName;
  final String tempreture;
  final int productPrice;
  int quantity;

  CartProductModel(
      {required this.productName,
      required this.tempreture,
      required this.quantity,
      required this.productPrice});

  factory CartProductModel.fromProductModel({
    required ProductModel product,
    required VariantsModel productVariants,
    required int quantity,
  }) {
    return CartProductModel(
      productName: product.productName,
      tempreture: product.tempreture,
      productPrice: productVariants.price,
      quantity: quantity,
    );
  }

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productName: json['product_name'],
      tempreture: json['tempreture'],
      quantity: json['quantity'],
      productPrice: json['product_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_name': productName,
      'tempreture': tempreture,
      'quantity': quantity,
      'product_price': productPrice,
    };
  }
}
