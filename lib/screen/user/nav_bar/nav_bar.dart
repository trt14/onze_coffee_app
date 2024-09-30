import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onze_coffee_app/cubits/nav_bar/nav_bar_cubit.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: Builder(builder: (context) {
        final navCubit = context.read<NavBarCubit>();
        return BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            return Scaffold(
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
                    icon: Badge(child: Icon(Icons.notifications_sharp)),
                    label: 'Notifications',
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
