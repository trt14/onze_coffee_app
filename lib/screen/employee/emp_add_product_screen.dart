import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/category_cubit/category_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/custom_add_image.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';
import 'package:onze_coffee_app/widget/custom_text_field.dart';

class EmpAddProductScreen extends StatelessWidget {
  const EmpAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.white,
            leading: const Icon(Icons.arrow_back),
            title: const Center(child: Text("Add Product")),
          ),
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const CustomAddImage(),
                CustomTextField(
                  title: "Product Name",
                  hint: "Product Name",
                ),
                CustomTextField(
                  title: "Product Description",
                  hint: "product description",
                  maxLines: 4,
                ),
                CustomTextField(
                  title: "Price",
                  hint: "Price",
                ),
                CustomTextField(
                  title: "Calories",
                  hint: "Calories",
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hot/Cold",
                        style: TextStyle(
                            color: AppColor.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          ChoiceChip(
                            label: const Text("Hot"),
                            selected: true,
                            selectedColor: AppColor.forth,
                            side: const BorderSide(
                                color: AppColor.primary, width: 2),
                            labelStyle:
                                const TextStyle(color: AppColor.primary),
                            showCheckmark: false,
                            onSelected: (value) {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const CustomChoiceChip(
                              title: "Cold", isSelected: false)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocProvider(
                  create: (context) => CategoryCubit(),
                  child: Builder(builder: (context) {
                    final categoryReadCubit = context.read<CategoryCubit>();

                    return Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Category",
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColor.primary),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height:
                                                context.getHeight(value: 0.3),
                                            decoration: BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text(
                                                    'Add new category',
                                                    style: TextStyle(
                                                        color: AppColor.primary,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  CustomTextField(
                                                    title: "Categore Name",
                                                    controller:
                                                        categoryReadCubit
                                                            .txtEditController,
                                                  ),
                                                  CustomMainButton(
                                                    title: "Add Category",
                                                    onPressed: () {
                                                      categoryReadCubit
                                                          .addNewCategoryEvent();
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 14,
                                      color: AppColor.white,
                                    ),
                                  ))
                            ],
                          ),
                          BlocBuilder<CategoryCubit, CategoryState>(
                            builder: (context, state) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      categoryReadCubit.categoryList.length,
                                      (int index) {
                                    return Row(
                                      children: [
                                        CustomChoiceChip(
                                            title: categoryReadCubit
                                                .categoryList[index]["name"],
                                            isSelected: false),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                    child: CustomMainButton(
                  title: "Add Product",
                )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
