import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/models/bill_model.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  BillModel? bill;
  getOrderDetails(int id) async {
    try {
      bill = await OrderRepository().getBill(id);
     if (!isClosed)  emit(SuccessState());
    } catch (e) {
    }
  }

  Stream<List<Map<String, dynamic>>>? getStatus(int id) {
    try {
      final res = OrderRepository().getNewStatus(id);

      return res;
    } catch (e) {
    }
    return null;
  }
}
