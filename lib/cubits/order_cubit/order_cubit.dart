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
  final userLayer = GetIt.I.get<UserLayer>();
  List<BillModel> bills = [];
  OrderCubit() : super(OrderInitial()) {
    if (userLayer.user.role == "employee") {
      getBills();
    } else {
      getUserBills();
    }
  }

  Future<int> addNewOrder() async {
    if (!isClosed) emit(LoadingOrderState());
    final responseCreateOrder = await OrderRepository().addNewOrderID(
        userID: userLayer.user.id,
        amount: getAllAmountItems(cart: userLayer.myCart));

    if (responseCreateOrder != null) {

      for (var element in GetIt.I.get<UserLayer>().myCart) {
        final productV = await OrderRepository()
            .getProductVarient(productID: element.productID);

        await OrderRepository().addOrderItem(
            userID: userLayer.user.id,
            price: element.productPrice.toDouble(),
            orderID: responseCreateOrder,
            quantity: element.quantity,
            productID: productV);
      }
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
    await Future.delayed(Duration.zero);

    if (!isClosed) emit(LoadingOrderState());

    await PaymentRepository().addNewPayment(
        userID: userLayer.user.id,
        paymentMethod: paymentMethod,
        paymentStatus: paymentStatus,
        orderID: orderID,
        transactionID: transicitionID,
        amount: getAllAmountItems(cart: GetIt.I.get<UserLayer>().myCart));

    await OrderRepository().updateOrderID(
        userID: userLayer.user.id,
        amount: amount,
        status: "holding",
        orderID: orderID);
    if (!isClosed) {
      GetIt.I.get<UserLayer>().myCart.clear();
      GetIt.I.get<UserLayer>().totalAmount = 0;
      emit(const SuccessOrderPaymentState(msg: "Done :)"));
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
      emit(FailedState());
    }
  }

  getUserBills() async {
    await Future.delayed(Duration.zero);
    if (!isClosed) emit(LoadingOrderState());
    try {
      bills = await OrderRepository().getUserBill(id: userLayer.user.id);
      if (!isClosed) emit(SuccessState());
    } catch (e) {
      emit(FailedState());
    }
  }

  emitSuccess() async {
    await Future.delayed(Duration.zero);

    if (!isClosed) emit(LoadingOrderState());
  }
}
