import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/models/product_model.dart';
import 'package:onze_coffee_app/screen/user/user_cart_screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_button_bottom_sheet.dart';
import 'package:onze_coffee_app/widget/product_description.dart';
import 'package:onze_coffee_app/widget/product_title.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Detail")),
      ),
      bottomSheet: BlocProvider(
        create: (context) => CartCubit(),
        child: Builder(builder: (context) {
          final cartReadCubit = context.read<CartCubit>();

          return CustomButtonBottomSheet(
            title: "Add to Cart",
            isEmployee: true,
            price: product.variants.first.price.toString(),
            onPressed: () {
              cartReadCubit.addItemsToCart(
                  product: product,
                  qnty: 1,
                  productVarient: product.variants.first);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserCartScreen()),
              );
            },
          );
        }),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              product.imageUrls.first != null
                  ? CachedNetworkImage(
                      imageUrl: product.imageUrls.first,
                      height: context.getHeight(value: .3),
                    )
                  : Image.asset("assets/logo/onze_logo.png"),
              ProductTitle(
                name: product.productName,
                cal: product.variants.first.calories.toString(),
                type: product.tempreture,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Divider(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      "Description"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ProductDescription(description: product.description),
              const SizedBox(
                height: 30,
              ),
              if (product.imageUrls.first != null)
                ImageSlideshow(
                  children:
                      List.generate(product.imageUrls.length, (int index) {
                    return CachedNetworkImage(
                        imageUrl: product.imageUrls[index]);
                  }),
                ),
              SizedBox(
                height: context.getHeight(value: .2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
