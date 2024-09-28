import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/comment/counter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.imageSrc,
      required this.name,
      required this.type,
      this.increment,
      this.decrement,
      this.enable = true,
      required this.qty});
  final String imageSrc;
  final String name;
  final String type;
  final void Function()? increment;
  final void Function()? decrement;
  final bool? enable;
  final String qty;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.getHeight(value: .3),
          child: ListTile(
            leading: Image.asset(
              width: 54,
              height: 54,
              imageSrc,
            ),
            title: Text(name),
            subtitle: Text(type),
          ),
        ),
        enable != false
            ? Counter(
              qty: qty,
                decrement: decrement,
                increment: increment,
              )
            : Text("X $qty")
      ],
    );
  }
}
