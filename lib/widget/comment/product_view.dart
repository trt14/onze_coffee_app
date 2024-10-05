import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';

class ProductView extends StatelessWidget {
  const ProductView(
      {super.key,
      this.imageSrc = "",
      required this.name,
      required this.type,
      required this.price,
      required this.onPressed,
      this.onTap,
      this.isEmployee = false});
  final String imageSrc;
  final String name;
  final String type;
  final String price;
  final bool isEmployee;
  final void Function() onPressed;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getWidth(value: 1),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: AppColor.white,
          elevation: 4,
          child: Column(
            children: [
              imageSrc != ""
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 100,
                        child: CachedNetworkImage(
                          imageUrl: imageSrc,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                              "assets/logo/onze_logo.png",
                              height: 100),
                        ),
                      ),
                      // child: Image.network(imageSrc, height: 90),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          Image.asset("assets/logo/onze_logo.png", height: 100),
                    ),
              ListTile(
                title: Text(
                  name,
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(type),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: isEmployee == false
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    Text(
                        style: const TextStyle(color: AppColor.secondary),
                        "$price SAR"),
                    isEmployee == false
                        ? SizedBox(
                            height: context.getHeight(value: .05),
                            width: context.getWidth(value: .11),
                            child: IconButton.filled(
                              style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                      AppColor.primary)),
                              onPressed: onPressed,
                              icon: const Icon(
                                Icons.add,
                                color: AppColor.white,
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
