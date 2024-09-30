import 'package:onze_coffee_app/models/cart_product_model.dart';
import 'package:onze_coffee_app/models/product_model.dart';

class CartModel {
  final List<CartProductModel> products;
  final double amount;
  final String notes;

  CartModel({
    required this.products,
    required this.amount,
    required this.notes,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      products: (json['products'] as List)
          .map((productJson) => CartProductModel.fromJson(productJson))
          .toList(),
      amount: json['amount'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'amount': amount,
      'notes': notes,
    };
  }
}
