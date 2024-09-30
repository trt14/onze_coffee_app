import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/models/cart_product_model.dart';
import 'package:onze_coffee_app/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<CartProductModel> myCart = [];
  CartCubit() : super(CartInitial());

  addItemsToCart({required ProductModel product, required int qnty}) {
    emit(LoagingCartState());
    myCart.add(CartProductModel(
        productName: product.productName,
        tempreture: product.tempreture,
        quantity: qnty));
        

    emit(SuccessCartState(msg: "Done :)"));

    print(myCart.first);
  }
}
