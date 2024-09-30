import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onze_coffee_app/cubit/admin_nav/admin_nav_cubit.dart';
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
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmpAddProductScreen(),
                    ),
                  );
                },
                child: const Icon(FontAwesomeIcons.plus),
              ),
              body: navCubit.screens[navCubit.index],
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                  navCubit.index = index;
                  navCubit.update();
                },
                indicatorColor: Colors.amber,
                selectedIndex: navCubit.index,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(FontAwesomeIcons.cartShopping),
                    label: 'Orders',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.notifications_sharp),
                    label: 'Notifications',
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
