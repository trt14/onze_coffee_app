import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:onze_coffee_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:onze_coffee_app/cubits/order_cubit/order_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/models/cart_product_model.dart';
import 'package:onze_coffee_app/screen/user/user_payment_screen.dart';

import 'package:onze_coffee_app/widget/bill.dart';
import 'package:onze_coffee_app/widget/comment/custom_button_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/comment/product_card.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({super.key, required this.myCart});
  final List<CartProductModel>? myCart;

  @override
  Widget build(BuildContext context) {
    double amount = 0;
    int orderID = 0;
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Builder(builder: (context) {
        final cartReadCubit = context.read<CartCubit>();

        return Scaffold(
          bottomSheet: BlocProvider(
            create: (context) => OrderCubit(),
            child: Builder(builder: (context) {
              final orderReadCubit = context.read<OrderCubit>();
              return CustomButtonBottomSheet(
                title: "BUY NOW!!",
                onPressed: () async {
                  // showDialog<String>(
                  //     context: context,
                  //     builder: (BuildContext context) => SizedBox(
                  //         width: 50,
                  //         child: LoadingAnimationWidget.twistingDots(
                  //           leftDotColor: AppColor.primary,
                  //           rightDotColor: AppColor.secondary,
                  //           size: 100,
                  //         )));
                  orderID = await orderReadCubit.addNewOrder();
                  print(orderID);
                  amount = orderReadCubit.getAllAmountItems(cart: myCart!);
                  print(amount);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserPaymentScreen(
                            amount: amount, orderID: orderID)),
                  );
                },
              );
            }),
          ),
          appBar: AppBar(
            title: const Center(child: Text("Detail")),
          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Center(
                  child: CustomMainButton(
                    title: "Pick Up",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is EmptyCartState || myCart!.isEmpty) {
                      return Text("Empty Cart",
                          style: TextStyle(
                              color: AppColor.secondary, fontSize: 20));
                    }
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: context.getHeight(value: 0.2)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(myCart!.length, (index) {
                            return Column(
                              children: [
                                ProductCard(
                                  qty: myCart![index].quantity.toString(),
                                  decrement: () {
                                    myCart![index].quantity--;
                                    cartReadCubit.updateDecreaseAmount(
                                        cart: myCart![index]);
                                  },
                                  increment: () {
                                    myCart![index].quantity++;
                                    cartReadCubit.updateIncreamentAmount(
                                        price: myCart![index].productPrice,
                                        qnt: myCart![index].quantity);
                                  },
                                  imageSrc: "assets/product/image.png",
                                  name: myCart![index].productName,
                                  type: myCart![index].tempreture,
                                ),
                                const Divider(),
                              ],
                            );
                          }),
                        ),
                      ),
                    );
                  },
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Bill(
                      price: cartReadCubit
                          .getAllAmountItems(cart: myCart!)
                          .toString(),
                    );
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
