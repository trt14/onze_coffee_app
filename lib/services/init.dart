import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';

void setup() {
// Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingleton<UserLayer>(UserLayer());
}
