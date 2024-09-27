import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/product/image.png"),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text("Caffe Mocha"),
                        subtitle: Text("Hot"),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
