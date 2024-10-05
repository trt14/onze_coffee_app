import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:onze_coffee_app/data_layer/user_layer.dart';
import 'package:onze_coffee_app/helper/custom_alert.dart';
import 'package:onze_coffee_app/helper/custom_colors.dart';
import 'package:onze_coffee_app/screen/employee/admin_nav.dart';
import 'package:onze_coffee_app/screen/user/nav_bar/user_nav.dart';
import 'package:onze_coffee_app/widget/custom_main_button.dart';
import 'package:onze_coffee_app/widget/custom_pinput.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email, required this.type});
  final String email;
  final int type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        final authCubit = context.read<AuthCubit>();
        return Scaffold(
          backgroundColor: AppColor.primary,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Please enter the OTP sent to ',
                    style: TextStyle(
                      color: AppColor.white,
                    )),
                Text('\n$email',
                    softWrap: true,
                    style: const TextStyle(
                        color: AppColor.forth, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                CustomPinput(
                  onCompleted: (otp) async {
                      await authCubit.verifyEmailOtp(email: email, otp: otp,type: type);
                  
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      // Show loading indicator
                    } else if (state is AuthSuccess) {
                      // OTP verification success, navigate to next screen

                      if (GetIt.I.get<UserLayer>().user.role == "user") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserNav(),
                            ),
                            (Route<dynamic> route) => false);
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminNav(),
                            ),
                            (Route<dynamic> route) => false);
                      }
                    } else if (state is AuthFailure) {
                      // Show error message
                        showAlertSnackBar(
                            context: context,
                            color: AppColor.secondary,
                            title: state.errorMessage,
                            colorStatus: AppColor.secondary);
                    }
                  },
                  builder: (context, state) {
                    return state is AuthLoading
                        ? const CircularProgressIndicator(
                            color: AppColor.secondary,
                          )
                        : const CustomMainButton(
                            title: "Verify OTP",
                            color: AppColor.secondary,
                            onPressed: null,
                          );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
