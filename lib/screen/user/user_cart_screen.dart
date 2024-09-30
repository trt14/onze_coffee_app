import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/models/cart_product_model.dart';

import 'package:onze_coffee_app/widget/bill.dart';
import 'package:onze_coffee_app/widget/comment/custom_button_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/comment/product_card.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({super.key, required this.myCart});
  final List<CartProductModel> myCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: CustomButtonBottomSheet(
        title: "BUY NOW!!",
        onPressed: () {},
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
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: context.getHeight(value: 0.2)),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(myCart.length, (index) {
                    return Column(
                      children: [
                        ProductCard(
                          qty: myCart[index].quantity.toString(),
                          decrement: () {},
                          increment: () {},
                          imageSrc: "assets/product/image.png",
                          name: myCart[index].productName,
                          type: myCart[index].tempreture,
                        ),
                        const Divider(),
                      ],
                    );
                  }),
                ),
              ),
            ),
            const Bill(
              price: "30",
            )
          ],
        ),
      ),
    );
  }
}
