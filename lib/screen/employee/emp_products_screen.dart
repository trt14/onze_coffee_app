import 'package:flutter/material.dart';
import 'package:onze_coffee_app/widget/comment/custom_choice_chip.dart';
import 'package:onze_coffee_app/widget/comment/product_view.dart';

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
                onTap: () {},
                onPressed: () {},
                name: "Coffee Mocha",
                price: "10",
                isEmployee: true,
                type: "Deep Foam",
              ),
              ProductView(
                onTap: () {},
                onPressed: () {},
                name: "Coffee Mocha",
                price: "10",
                isEmployee: true,
                type: "Deep Foam",
              ),
              ProductView(
                onTap: () {},
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
