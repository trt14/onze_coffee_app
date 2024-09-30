import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/models/bill_model.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  BillModel? bill;
  getOrderDetails(int id) async {
    print("iam at get order details");
    try {
      bill = await OrderRepository().getBill(id);
      print(bill?.totalPrice.toString());
      emit(SuccessState());
    } catch (e) {
      print(e);
    }
  }
}
