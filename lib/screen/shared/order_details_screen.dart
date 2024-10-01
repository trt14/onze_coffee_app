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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            children: [
                              Text("Order #${orderCubit.bill?.billId}"),
                              Text("Date : ${orderCubit.bill?.createdAt}")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //progress indicator
                        StreamBuilder<List<Map<String, dynamic>>>(
                            stream: orderCubit.getStatus(billId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final data = snapshot.data!;
                                print(data[0]["id"]);
                                print(orderCubit.bill?.createdAt);
                                print("here data");
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //status
                                    if (data[0]["status"] == 'rejected')
                                      Column(
                                        children: [
                                          const Text("rejected"),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: context.getWidth(value: 0.5),
                                            height:
                                                context.getHeight(value: .006),
                                            child:
                                                const LinearProgressIndicator(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    value: 1,
                                                    color: AppColor.secondary),
                                          ),
                                        ],
                                      )
                                    else
                                      Column(
                                        children: [
                                          const Text("holding"),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: context.getWidth(value: .2),
                                            height:
                                                context.getHeight(value: .006),
                                            child: LinearProgressIndicator(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                value: 1,
                                                color: data[0]["status"] ==
                                                        "holding"
                                                    ? AppColor.secondary
                                                    : AppColor.primary),
                                          ),
                                        ],
                                      ),

                                    if (data[0]["status"] != "holding" &&
                                        data[0]["status"] != "rejected")
                                      Column(
                                        children: [
                                          const Text("Processing"),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: context.getWidth(value: .2),
                                            height:
                                                context.getHeight(value: .006),
                                            child: LinearProgressIndicator(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              value: 1,
                                              color: data[0]["status"] ==
                                                      "processing"
                                                  ? AppColor.secondary
                                                  : AppColor.primary,
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      SizedBox(
                                        width: context.getWidth(value: .2),
                                        height: context.getHeight(value: .006),
                                      ),
                                    data[0]["status"] == "completed"
                                        ? Column(
                                            children: [
                                              const Text("Complete"),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              SizedBox(
                                                width:
                                                    context.getWidth(value: .2),
                                                height: context.getHeight(
                                                    value: .006),
                                                child:
                                                    const LinearProgressIndicator(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  value: 1,
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(
                                            width: context.getWidth(value: .2),
                                            height:
                                                context.getHeight(value: .006),
                                          ),
                                  ],
                                );
                              }
                              return CircularProgressIndicator(
                                color: AppColor.forth,
                              );
                            }),

                        if (orderCubit.bill?.products.isNotEmpty ?? false)
                          Column(
                            children: List.generate(
                                orderCubit.bill!.products.length, (int index) {
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ProductCard(
                                  qty: orderCubit.bill!.products[index].qty
                                      .toString(),
                                  enable: false,
                                  imageSrc: "assets/product/image.png",
                                  name: orderCubit.bill!.products[index].name,
                                  type: orderCubit.bill!.products[index].size,
                                ),
                              );
                            }),
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text(
                                style:
                                    const TextStyle(color: AppColor.secondary),
                                orderCubit.bill?.note ?? "no notes"),
                          ),
                        )
                      ],
                    ),
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
