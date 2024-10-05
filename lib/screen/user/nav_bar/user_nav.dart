import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onze_coffee_app/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/screen/auth/auth_check_screen.dart';
import 'package:onze_coffee_app/widget/comment/custom_loading.dart';

class UserNav extends StatelessWidget {
  const UserNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: Builder(builder: (context) {
        final navCubit = context.read<NavBarCubit>();
        return BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            return BlocListener<NavBarCubit, NavBarState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is LoadingNavState) {
                  customLoading(context: context);
                }
                if (state is SuccessLogoutState) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthCheckScreen(),
                      ),
                      (Route<dynamic> route) => false);
                }
              },
              child: Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        await navCubit.logout();
                      },
                    )
                  ],
                ),
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
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.notifications_sharp),
                      label: 'Notifications',
                      selectedIcon: Icon(
                        Icons.notifications_sharp,
                        color: AppColor.white,
                      ),
                    ),
                    NavigationDestination(
                      icon: Icon(FontAwesomeIcons.cartShopping),
                      label: 'Cart',
                      selectedIcon: Icon(
                        FontAwesomeIcons.cartShopping,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
