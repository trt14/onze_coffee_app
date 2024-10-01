import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/order_details/order_details_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_pay_details_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/comment/product_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.billId});
  final int billId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit()..getOrderDetails(billId),
      child: Builder(builder: (context) {
        final orderCubit = context.read<OrderDetailsCubit>();
        
        return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            return Scaffold(
              bottomSheet: CustomPayDetailsBottomSheet(
                price: "${orderCubit.bill?.totalPrice}",
              ),
              appBar: AppBar(
                title: const Center(
                  child: Text("Order details"),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      const Center(
                        child: Text("Order # 217"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //progress indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //status
                          Column(
                            children: [
                              const Text("holding"),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: context.getWidth(value: .2),
                                height: context.getHeight(value: .006),
                                child: const LinearProgressIndicator(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  value: 1,
                                  color: AppColor.primary,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              const Text("Processing"),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: context.getWidth(value: .2),
                                height: context.getHeight(value: .006),
                                child: const LinearProgressIndicator(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  value: 1,
                                  color: AppColor.primary,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              const Text("Complete"),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: context.getWidth(value: .2),
                                height: context.getHeight(value: .006),
                                child: const LinearProgressIndicator(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  value: 1,
                                  color: AppColor.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ProductCard(
                          qty: "2",
                          enable: false,
                          imageSrc: "assets/product/image.png",
                          name: "Coffee Mocha",
                          type: "Deep Foam",
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            style: TextStyle(fontWeight: FontWeight.bold),
                            "Note:"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                          child: Text(
                              style: TextStyle(color: AppColor.secondary),
                              "Do not add milk to the coffee "),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
