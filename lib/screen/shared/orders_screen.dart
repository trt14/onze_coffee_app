import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/widget/custom_container_order.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Orders")),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
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
              height: 20,
            ),
            CustomContainerOrder(
                isNote: false,
                orderID: "217",
                height: 120,
                width: 1,
                statusColor: AppColor.forth,
                textStatus: "Hold",
                productsWithQuntity:
                    "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1"),
            CustomContainerOrder(
                isNote: false,
                orderID: "217",
                height: 120,
                width: 1,
                statusColor: AppColor.secondary,
                textStatus: "Rejected",
                productsWithQuntity:
                    "Coffee Mocha x 1  ,  Coffee Mocha x 2  ,  Coffee Mocha x 1"),
          ],
        ),
      ),
    );
  }
}
