import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/order_cubit/order_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
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
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "27,December,2024",
                  style: TextStyle(
                      color: AppColor.secondary, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomContainerOrder(
                    isNote: false,
                    orderID: "217",
                    height: 120,
                    width: 1,
                    price: 20,
                    textStatus: "Completed",
                    productsWithQuntity:
                        "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1"),
                SizedBox(
                  height: 10,
                ),

                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return Column(
                      children:
                          List.generate(orderCubit.bills.length, (int index) {
                        return CustomContainerOrder(
                            isNote: orderCubit.bills[index].note.isNotEmpty,
                            orderID: orderCubit.bills[index].billId.toString(),
                            height: 120,
                            width: 1,
                            price:
                                orderCubit.bills[index].totalPrice.toDouble(),
                            statusColor: AppColor.forth,
                            note: orderCubit.bills[index].note,
                            textStatus: orderCubit.bills[index].status,
                            productsWithQuntity:
                                "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1");
                      }),
                    );
                  },
                ),

                // CustomContainerOrder(
                //     isNote: false,
                //     orderID: "217",
                //     height: 120,
                //     width: 1,
                //     statusColor: AppColor.forth,
                //     textStatus: "Hold",
                //     productsWithQuntity:
                //         "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1"),
                // SizedBox(
                //   height: 10,
                // ),
                // CustomContainerOrder(
                //     isNote: false,
                //     orderID: "217",
                //     height: 120,
                //     width: 1,
                //     statusColor: AppColor.secondary,
                //     textStatus: "Rejected",
                //     productsWithQuntity:
                //         "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1"),
              ],
            ),
          ),
        );
      }),
    );
  }
}
