import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';
import 'package:onze_coffee_app/models/cart_product_model.dart';
import 'package:onze_coffee_app/models/product_model.dart';
import 'package:onze_coffee_app/models/variants_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<CartProductModel>? myCart = GetIt.I.get<UserLayer>().myCart;

  late double totalAmount = GetIt.I.get<UserLayer>().totalAmount;

  CartCubit() : super(CartInitial());

  addItemsToCart(
      {required ProductModel product,
      required int qnty,
      required VariantsModel productVarient}) {
    emit(LoagingCartState());
    myCart?.add(CartProductModel(
        productName: product.productName,
        tempreture: product.tempreture,
        productPrice: productVarient.price,
        quantity: qnty));
    updateIncreamentAmount(price: productVarient.price, qnt: 1);
    // print(totalAmount);
    emit(SuccessCartState(msg: "Done :)"));
  }

  updateIncreamentAmount({required int price, required int qnt}) {
    // totalAmount += (price * qnt);
    print("totalAmount 1: $totalAmount");
    totalAmount = (price * qnt).toDouble();
    print("totalAmount 2: $totalAmount");
    emit(SuccessCartState(msg: "Done:)"));
  }

  double getAllAmountItems({required List<CartProductModel> cart}) {
    double sum = 0;
    for (var element in cart) {
      sum += element.productPrice * element.quantity;
    }
    emit(SuccessCartState(msg: "Done:)"));
    return sum;
  }

  updateDecreaseAmount({required CartProductModel cart}) {
    if (cart.quantity <= 0) {
      myCart!.remove(cart);
      totalAmount = 0;
      emit(SuccessCartState(msg: "Done:)"));
    } else {
      totalAmount = totalAmount - cart.productPrice;
      emit(SuccessCartState(msg: "Done:)"));
    }
  }
}
