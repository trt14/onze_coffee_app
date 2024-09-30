import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/models/bill_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  List<BillModel> bills = [];
  OrderCubit() : super(OrderInitial()) {
    getBills();
  }

  getBills() async {
    try {
      bills = await OrderRepository().getEmployeeBill();
      emit(SuccessState());
    } catch (e) {
      print(e);
    }
  }
}
