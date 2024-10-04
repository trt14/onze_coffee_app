import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/emp_home/emp_home_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';
import 'package:onze_coffee_app/widget/custom_container_order.dart';

class EmpHomeScreen extends StatelessWidget {
  const EmpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmpHomeCubit(),
      child: Builder(builder: (context) {
        final empHomeCubit = context.read<EmpHomeCubit>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Order Status",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<EmpHomeCubit, EmpHomeState>(
                  builder: (context, state) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            empHomeCubit.orderDataLayer.orderStatus.length,
                            (int index) {
                          return CustomChoiceChip(
                            title:
                                empHomeCubit.orderDataLayer.orderStatus[index],
                            isSelected:
                                index == empHomeCubit.orderDataLayer.index,
                            lblColor: AppColor.white,
                            selectedColor: AppColor.secondary,
                            onSelected: (value) {
                              empHomeCubit.orderDataLayer.index = index;
                              empHomeCubit.updateChip();
                              empHomeCubit.getOrderByStatus(index);
                            },
                          );
                        }));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<EmpHomeCubit, EmpHomeState>(
                  builder: (context, state) {
                    return Column(
                        children: empHomeCubit.orderDataLayer.orders.isNotEmpty
                            ? List.generate(
                                empHomeCubit.orderDataLayer.orders.length,
                                (int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onLongPress: () async {
                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('ALERT'),
                                                  content:
                                                      const SingleChildScrollView(
                                                    child: Text(
                                                        "YOUR GOING TO REJECT THIS ORDER"),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text(
                                                        'Reject',
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .secondary),
                                                      ),
                                                      onPressed: () async {
                                                        await empHomeCubit.updateOrder(
                                                            status: "rejected",
                                                            billId: empHomeCubit
                                                                .orderDataLayer
                                                                .orders[index]
                                                                .billId);
                                                        if (context.mounted) {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: CustomContainerOrder(
                                            isNote: true,
                                            note: empHomeCubit
                                                    .orderDataLayer
                                                    .orders[index]
                                                    .note
                                                    .isNotEmpty
                                                ? "Note: ${empHomeCubit.orderDataLayer.orders[index].note}"
                                                : "",
                                            orderID: empHomeCubit.orderDataLayer
                                                .orders[index].billId
                                                .toString(),
                                            height: 100,
                                            width: 0.65,
                                            productsWithQuntity: empHomeCubit
                                                .orderDataLayer
                                                .orders[index]
                                                .products
                                                .map((element) =>
                                                    "${element.name} x${element.qty}")
                                                .toString(),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            try {
                                              if (empHomeCubit.orderDataLayer
                                                      .orders[index].status ==
                                                  "holding") {
                                                await empHomeCubit.updateOrder(
                                                    status: "processing",
                                                    billId: empHomeCubit
                                                        .orderDataLayer
                                                        .orders[index]
                                                        .billId);
                                              }

                                              if (empHomeCubit.orderDataLayer
                                                      .orders[index].status ==
                                                  "processing") {
                                                await empHomeCubit.updateOrder(
                                                    status: "completed",
                                                    billId: empHomeCubit
                                                        .orderDataLayer
                                                        .orders[index]
                                                        .billId);
                                              }
                                            } catch (e) {}
                                          },
                                          child: Container(
                                            width:
                                                context.getWidth(value: 0.25),
                                            height: 100,
                                            color: AppColor.primary,
                                            child: Image.asset(
                                                "assets/images/onzo-icon.png"),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const [Center(child: Text("No order here"))]);
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
