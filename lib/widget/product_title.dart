
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.name,
    required this.type,
    required this.cal,
  });
  final String name;
  final String type;
  final String cal;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: context.getWidth(value: .5),
          child: ListTile(
            title: Text(name),
            subtitle: Text(type),
          ),
        ),
        Row(
          children: [
            const Icon(color: AppColor.secondary, FontAwesomeIcons.fire),
            const SizedBox(width: 3),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                  style: const TextStyle(color: AppColor.secondary),
                  "$cal Cal"),
            )
          ],
        )
      ],
    );
  }
}
