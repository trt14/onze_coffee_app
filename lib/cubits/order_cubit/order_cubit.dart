import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/data/repositories/payment_repository.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';
import 'package:onze_coffee_app/models/bill_model.dart';
import 'package:onze_coffee_app/models/cart_product_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  List<CartProductModel>? myCart = GetIt.I.get<UserLayer>().myCart;
  List<BillModel> bills = [];
  late double totalAmount = GetIt.I.get<UserLayer>().totalAmount;
  OrderCubit() : super(OrderInitial()) {
    getBills();
  }

  Future<int> addNewOrder() async {
    if (!isClosed) emit(LoadingOrderState());
    final responseCreateOrder = await OrderRepository().addNewOrderID(
        userID: "e1552d62-c042-4130-9d9c-7f6dceb3d966",
        amount: getAllAmountItems(cart: myCart!));

    if (responseCreateOrder != null) {
      print(responseCreateOrder);

      for (var element in myCart!) {
        final productV = await OrderRepository()
            .getProductVarient(productID: element.productID);

        await OrderRepository().addOrderItem(
            userID: "e1552d62-c042-4130-9d9c-7f6dceb3d966",
            price: element.productPrice.toDouble(),
            orderID: responseCreateOrder,
            quantity: element.quantity,
            productID: productV);
      }
      print("Order Items were created");
      emit(const SuccessOrderState(msg: "Create order Items"));
      return responseCreateOrder;
    }
    return 0;
  }

  double getAllAmountItems({required List<CartProductModel> cart}) {
    double sum = 0;
    for (var element in cart) {
      sum += element.productPrice * element.quantity;
    }
    return sum;
  }

  addNewPayment(
      {required String paymentMethod,
      required String paymentStatus,
      required int orderID,
      required String transicitionID,
      required double amount}) async {
    if (!isClosed) emit(LoadingOrderState());

    await PaymentRepository().addNewPayment(
        userID: "e1552d62-c042-4130-9d9c-7f6dceb3d966",
        paymentMethod: paymentMethod,
        paymentStatus: paymentStatus,
        orderID: orderID,
        transactionID: transicitionID,
        amount: getAllAmountItems(cart: myCart!));

    await OrderRepository().updateOrderID(
        userID: "e1552d62-c042-4130-9d9c-7f6dceb3d966",
        amount: amount,
        status: "holding",
        orderID: orderID);
    if (!isClosed) {
      emit(const SuccessOrderPaymentState(msg: "Done :)"));
      GetIt.I.get<UserLayer>().myCart.clear();
      GetIt.I.get<UserLayer>().totalAmount = 0;
    }
  }

  getBills() async {
    await Future.delayed(Duration.zero);
    if (!isClosed) emit(LoadingOrderState());

    try {
      bills = await OrderRepository().getEmployeeBill();
      bills = bills.reversed.toList();
      if (!isClosed) emit(SuccessState());
    } catch (e) {
      print(e);
    }
  }

  emitSuccess() async {
    await Future.delayed(Duration.zero);

    if (!isClosed) emit(LoadingOrderState());
  }
}
