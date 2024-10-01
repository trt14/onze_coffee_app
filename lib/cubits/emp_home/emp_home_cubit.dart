import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/models/bill_model.dart';

part 'emp_home_state.dart';

class EmpHomeCubit extends Cubit<EmpHomeState> {
  List<String> orderStatus = ["hold", "accepted", "completed"];
  int index = 0;
  EmpHomeCubit() : super(EmpHomeInitial()) {
    getOrderByStatus(index);
  }
  List<BillModel> orders = [];
  getOrderByStatus(int index) async {
    print("iam at getOrderByStatus");
    emit(LoadingState());

    try {
      switch (index) {
        case == 0:
          orders = await OrderRepository().getOrderByStatus("holding");
          emit(SuccessState());
          break;
        case == 1:
          orders = await OrderRepository().getOrderByStatus("processing");
          emit(SuccessState());
          break;
        case == 2:
          orders = await OrderRepository().getOrderByStatus("completed");
          emit(SuccessState());
          break;
        default:
          orders = await OrderRepository().getOrderByStatus("holding");
          emit(SuccessState());
      }
    } catch (e) {
      print(e);
    }
  }

  updateChip() {
    emit(SuccessState());
  }
}
