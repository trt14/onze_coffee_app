import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/emp_home/emp_home_cubit.dart';
import 'package:onze_coffee_app/cubits/user_home/user_home_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/screen/shared/product_details_screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_loading.dart';
import 'package:onze_coffee_app/widget/comment/product_view.dart';
import 'package:onze_coffee_app/widget/custom_choice_chip.dart';

class EmpProductsScreen extends StatelessWidget {
  const EmpProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: Builder(
        builder: (context) {
          final homeCubit = context.read<UserHomeCubit>();
          return RefreshIndicator(
            onRefresh: () async {
              homeCubit.userProductCategory = -1;
              await homeCubit.getProducts();
            },
            child: SingleChildScrollView(
              physics:
                  const AlwaysScrollableScrollPhysics(), // Allows the scroll even when content doesn't overflow
              child: BlocListener<UserHomeCubit, UserHomeState>(
                listener: (context, state) {
                  if (state is GetProductSuccessState) {
                    print("iam at GetProductSuccessState");
                    Navigator.pop(context);
                  }

                  if (state is ProductLoadingState) {
                    print("iam at loading state");
                    customLoading(context: context);
                  }
                },
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<UserHomeCubit, UserHomeState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                homeCubit.categoryLayer.userCategories.length,
                                (int index) {
                              return Row(
                                children: [
                                  CustomChoiceChip(
                                    lblColor: AppColor.white,
                                    selectedColor: AppColor.secondary,
                                    isSelected: homeCubit.userProductCategory ==
                                        homeCubit.categoryLayer
                                            .userCategories[index]["id"],
                                    title: homeCubit.categoryLayer
                                        .userCategories[index]["name"],
                                    onSelected: (p0) {
                                      homeCubit.userProductCategory = homeCubit
                                          .categoryLayer
                                          .userCategories[index]["id"];
                                      homeCubit.updateChips();
                                      homeCubit.filterProduct(homeCubit
                                          .categoryLayer
                                          .userCategories[index]["name"]);
                                    },
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<UserHomeCubit, UserHomeState>(
                      builder: (context, state) {
                        return GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: .75),
                            children: List.generate(homeCubit.products.length,
                                (int index) {
                              return ProductView(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                        product: homeCubit.products[index],
                                      ),
                                    ),
                                  );
                                },
                                isEmployee: true,
                                imageSrc:
                                    homeCubit.products[index].imageUrls.first ??
                                        "",
                                onPressed: () {},
                                name: homeCubit.products[index].productName,
                                price:
                                    "${homeCubit.products[index].variants.first.price}",
                                type: homeCubit.products[index].productCategory,
                              );
                            }));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
