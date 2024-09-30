import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data_layer/category_layer.dart';
import 'package:onze_coffee_app/data_layer/product_layer.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';

void setup() {
  GetIt.I.registerSingleton<UserLayer>(UserLayer());
  GetIt.I.registerSingleton<CategoryLayer>(CategoryLayer());
  GetIt.I.registerSingleton<ProductLayer>(ProductLayer());
}
