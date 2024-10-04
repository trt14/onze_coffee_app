import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onze_coffee_app/cubits/admin_nav/admin_nav_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/screen/employee/emp_add_product_screen.dart';

class AdminNav extends StatelessWidget {
  const AdminNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminNavCubit(),
      child: Builder(builder: (context) {
        final navCubit = context.read<AdminNavCubit>();
        return BlocBuilder<AdminNavCubit, AdminNavState>(
          builder: (context, state) {
            return Scaffold(
              appBar: navCubit.appBars[navCubit.index],
              floatingActionButton: navCubit.index == 1
                  ? FloatingActionButton(
                      backgroundColor: AppColor.primary,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmpAddProductScreen(),
                          ),
                        ).then((value) {});
                      },
                      child: const Icon(
                        FontAwesomeIcons.plus,
                        color: AppColor.white,
                      ),
                    )
                  : null,
              body: navCubit.screens[navCubit.index],
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                  navCubit.index = index;
                  navCubit.update();
                },
                indicatorColor: AppColor.primary,
                selectedIndex: navCubit.index,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home,
                      color: AppColor.white,
                    ),
                    icon: Icon(Icons.home_outlined),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(FontAwesomeIcons.cartShopping),
                    selectedIcon: Icon(
                      FontAwesomeIcons.cartShopping,
                      color: AppColor.white,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.notifications_sharp),
                    selectedIcon: Icon(
                      Icons.notifications_sharp,
                      color: AppColor.white,
                    ),
                    label: '',
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
