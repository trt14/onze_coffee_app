import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/order_cubit/order_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/order_status.dart';
import 'package:onze_coffee_app/screen/shared/order_details_screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_loading.dart';
import 'package:onze_coffee_app/widget/custom_container_order.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: Builder(builder: (context) {
        final orderCubit = context.read<OrderCubit>();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<OrderCubit, OrderState>(
            listener: (context, state) {
              if (state is SuccessState) {
                Navigator.pop(context);
              }

              if (state is LoadingOrderState) {
                print("iam at loading state");
                customLoading(context: context);
              }
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "6,October,2024",
                    style: TextStyle(
                        color: AppColor.secondary, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) {
                      return orderCubit.bills.isNotEmpty
                          ? ListView.builder(
                              cacheExtent: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: orderCubit.bills.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OrderDetailsScreen(
                                            billId:
                                                orderCubit.bills[index].billId,
                                          ),
                                        ),
                                      );
                                    },
                                    child: CustomContainerOrder(
                                        isNote: orderCubit
                                            .bills[index].note.isNotEmpty,
                                        orderID: orderCubit.bills[index].billId
                                            .toString(),
                                        height: 120,
                                        width: 1,
                                        price: orderCubit
                                            .bills[index].totalPrice
                                            .toDouble(),
                                        statusColor: statusColor(
                                            orderCubit.bills[index].status),
                                        note: orderCubit.bills[index].note,
                                        textStatus:
                                            orderCubit.bills[index].status,
                                        productsWithQuntity: orderCubit
                                            .bills[index].products
                                            .map((element) =>
                                                "${element.name} x${element.qty}")
                                            .toString()),
                                  ),
                                );
                              })
                          : Center(
                              child: Text("No orders!"),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
