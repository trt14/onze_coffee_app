import 'package:onze_coffee_app/models/cart_product_model.dart';
import 'package:onze_coffee_app/models/user_model.dart';

class UserLayer {
  List<CartProductModel> myCart = [];
  late double totalAmount = 0;
  late UserModel user;
  String email = "";
}
