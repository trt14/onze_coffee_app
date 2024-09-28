import 'package:flutter/material.dart';

import 'package:onze_coffee_app/widget/bill.dart';
import 'package:onze_coffee_app/widget/comment/custom_button_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/comment/product_card.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({super.key});

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
            ProductCard(
              qty: "1",
              decrement: () {},
              increment: () {},
              imageSrc: "assets/product/image.png",
              name: "Coffee Mocha",
              type: "Deep Foam",
            ),
            const Divider(),
            const Bill(
              price: "30",
            )
          ],
        ),
      ),
    );
  }
}
