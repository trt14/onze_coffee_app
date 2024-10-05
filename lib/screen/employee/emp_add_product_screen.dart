import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/add_product/add_product_cubit.dart';
import 'package:onze_coffee_app/cubits/category_cubit/category_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/helper/screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_loading.dart';
import 'package:onze_coffee_app/widget/custom_add_image.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';
import 'package:onze_coffee_app/widget/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';

class EmpAddProductScreen extends StatelessWidget {
  const EmpAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
          final addProductCubit = context.read<AddProductCubit>();
          return BlocListener<AddProductCubit, AddProductState>(
            listener: (context, state) {
              if (state is LoadingAddState) {
                customLoading(context: context);
              }
              if (state is SuccessState) {
                Navigator.pop(context);
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColor.white,
                  leading: const Icon(Icons.arrow_back),
                  title: const Center(child: Text("Add Product")),
                ),
                backgroundColor: AppColor.white,
                body: SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        CustomAddImage(
                          onPressed: () async {
                            try {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                allowMultiple: true,
                                type: FileType.image,
                              );

                              if (result != null) {
                                addProductCubit.files = result.paths
                                    .map((path) => File(path!))
                                    .toList();
                              } else {}
                            } catch (e) {}
                          },
                        ),
                        CustomTextField(
                          title: "Product Name",
                          hint: "Product Name",
                          controller: addProductCubit.productNameController,
                        ),
                        CustomTextField(
                          title: "Product Description",
                          hint: "product description",
                          controller:
                              addProductCubit.productDescriptionController,
                          maxLines: 4,
                        ),
                        CustomTextField(
                          title: "Price",
                          hint: "Price",
                          controller: addProductCubit.priceController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'),
                            ),
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        CustomTextField(
                          title: "Calories",
                          hint: "Calories",
                          controller: addProductCubit.caloriesController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false),
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
                              BlocBuilder<AddProductCubit, AddProductState>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      CustomChoiceChip(
                                        title: "Hot",
                                        isSelected: 0 == addProductCubit.index,
                                        onSelected: (value) {
                                          addProductCubit.index = 0;
                                          addProductCubit.updateTempreture();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomChoiceChip(
                                        title: "Cold",
                                        isSelected: 1 == addProductCubit.index,
                                        onSelected: (value) {
                                          addProductCubit.index = 1;
                                          addProductCubit.updateTempreture();
                                        },
                                      )
                                    ],
                                  );
                                },
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
                            final categoryReadCubit =
                                context.read<CategoryCubit>();

                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AppColor.primary),
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              showModalBottomSheet<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height: context.getHeight(
                                                        value: 0.3),
                                                    decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          const Text(
                                                            'Add new category',
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .primary,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          CustomTextField(
                                                            title:
                                                                "Category Name",
                                                            controller:
                                                                categoryReadCubit
                                                                    .txtEditController,
                                                          ),
                                                          CustomMainButton(
                                                            title:
                                                                "Add Category",
                                                            onPressed: () {
                                                              categoryReadCubit
                                                                  .addNewCategoryEvent();
                                                              Navigator.pop(
                                                                  context);
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
                                              categoryReadCubit
                                                  .categoryLayer
                                                  .categoryList
                                                  .length, (int index) {
                                            return Row(
                                              children: [
                                                InkWell(
                                                  onLongPress: () async {
                                                    await categoryReadCubit
                                                        .deleteCategoryEvent(
                                                            categoryID: categoryReadCubit
                                                                    .categoryLayer
                                                                    .categoryList[
                                                                index]["id"]);
                                                  },
                                                  child: CustomChoiceChip(
                                                    title: categoryReadCubit
                                                            .categoryLayer
                                                            .categoryList[index]
                                                        ["name"],
                                                    isSelected: categoryReadCubit
                                                                .categoryLayer
                                                                .categoryList[
                                                            index]["id"] ==
                                                        categoryReadCubit
                                                            .productCategory,
                                                    onSelected: (value) {
                                                      categoryReadCubit
                                                              .productCategory =
                                                          categoryReadCubit
                                                                  .categoryLayer
                                                                  .categoryList[
                                                              index]["id"];

                                                      addProductCubit
                                                              .categoryId =
                                                          categoryReadCubit
                                                              .productCategory;
                                                      final category = categoryReadCubit
                                                          .categoryLayer
                                                          .categoryList
                                                          .firstWhere((element) =>
                                                              element["id"] ==
                                                              addProductCubit
                                                                  .categoryId);
                                                      addProductCubit
                                                              .productCategory =
                                                          category["name"];
                                                      categoryReadCubit
                                                          .updateChips();
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
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
                        Center(
                          child: CustomMainButton(
                            title: "Add Product",
                            onPressed: () async {
                              await addProductCubit.addProduct();
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
