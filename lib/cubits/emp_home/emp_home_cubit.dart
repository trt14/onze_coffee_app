import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/data_layer/order_layer.dart';
import 'package:onze_coffee_app/integrations/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'emp_home_state.dart';

class EmpHomeCubit extends Cubit<EmpHomeState> {
  final orderDataLayer = GetIt.I.get<OrderLayer>();
  bool enableChannel = false;
  EmpHomeCubit() : super(EmpHomeInitial()) {
    getOrderByStatus(orderDataLayer.index);
    synOrder();
  }

  getOrderByStatus(int index) async {
    print("cubit iam at getOrderByStatus");
    if (!isClosed) emit(LoadingState());

    try {
      switch (index) {
        case == 0:
          await OrderRepository().getOrderByStatus("holding");
          break;
        case == 1:
          await OrderRepository().getOrderByStatus("processing");
          break;
        case == 2:
          await OrderRepository().getOrderByStatus("completed");
          break;
        default:
          await OrderRepository().getOrderByStatus("holding");
          break;
      }
      if (!isClosed) emit(SuccessState());
    } catch (e) {
      print(e);
    }
  }

  updateOrder({required int billId, required String status}) async {
    print("Cubit acceptedOrder");
    if (!isClosed) emit(LoadingState());
    try {
      await OrderRepository().updateOrderStatus(id: billId, status: status);
      await getOrderByStatus(orderDataLayer.index);
      if (!isClosed) emit(SuccessState());
    } catch (e) {
      print(e);
    }
  }

  synOrder() async {
    supabase.client
        .channel('orders')
        .onPostgresChanges(
            event: PostgresChangeEvent.update,
            schema: 'public',
            table: 'orders',
            callback: (value) async {
              await getOrderByStatus(orderDataLayer.index);
            })
        .subscribe();
  }

  updateChip() {
    if (!isClosed) emit(UpdateState());
  }

  @override
  Future<void> close() async {
    await supabase.client.channel("orders").unsubscribe();
    super.close();
  }
}
