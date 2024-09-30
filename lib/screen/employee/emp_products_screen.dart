import 'package:flutter/material.dart';
import 'package:onze_coffee_app/data/repositories/order_repository.dart';
import 'package:onze_coffee_app/data/repositories/payment_repository.dart';
import 'package:onze_coffee_app/widget/comment/custom_choice_chip.dart';
import 'package:onze_coffee_app/widget/comment/product_view.dart';

import '../../data/repositories/category_repository.dart';
import '../../integrations/supabase/supabase_client.dart';

class EmpProductsScreen extends StatelessWidget {
  const EmpProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Products")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomChoiceChip(
                  selected: true,
                  text: "All Coffee",
                  onSelected: (bool value) {},
                ),
                CustomChoiceChip(
                  selected: false,
                  text: "Black",
                  onSelected: (bool value) {},
                ),
                CustomChoiceChip(
                  selected: false,
                  text: "Spanish",
                  onSelected: (bool value) {},
                ),
                CustomChoiceChip(
                  selected: false,
                  text: "Choclete",
                  onSelected: (bool value) {},
                ),
              ],
            ),
          ),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .75),
            children: [
              ProductView(
                onTap: () async {
                  await OrderRepository().addNewOrderID(
                    userID: "e1552d62-c042-4130-9d9c-7f6dceb3d966",
                  );
                },
                onPressed: () {},
                name: "Coffee Mocha",
                price: "10",
                isEmployee: true,
                type: "Deep Foam",
              ),
              ProductView(
                onTap: () async {
                  await PaymentRepository().addNewPayment(
                      userID: "e8661b98-e738-4093-80d3-4e9a9e7a90fd",
                      paymentMethod: "Visa",
                      paymentStatus: "paid",
                      orderID: 103,
                      transactionID: "123",
                      amount: 50);
                },
                onPressed: () {},
                name: "Coffee Mocha",
                price: "10",
                isEmployee: true,
                type: "Deep Foam",
              ),
              ProductView(
                onTap: () {
                  // OrderRepository().updateOrderItem(
                  //     orderItemID: 2,
                  //     userID: "e8661b98-e738-4093-80d3-4e9a9e7a90fd",
                  //     price: 1300,
                  //     quantity: 10,
                  //     productID: 1,
                  //     orderID: 106);

                  // OrderRepository().addOrderItem(
                  //     userID: "e8661b98-e738-4093-80d3-4e9a9e7a90fd",
                  //     price: 120,
                  //     orderID: 106,
                  //     quantity: 3,
                  //     productID: 1);
                },
                onPressed: () {},
                isEmployee: true,
                name: "Black Coffee",
                price: "10",
                type: "Deep Foam",
              )
            ],
          ),
        ],
      ),
    );
  }
}
