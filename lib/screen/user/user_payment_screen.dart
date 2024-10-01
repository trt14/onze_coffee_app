import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moyasar/moyasar.dart';
import 'package:onze_coffee_app/cubits/order_cubit/order_cubit.dart';
import 'package:onze_coffee_app/screen/shared/order_details_screen.dart';

class UserPaymentScreen extends StatelessWidget {
  UserPaymentScreen({super.key, required this.amount, required this.orderID});
  final double amount;
  final int orderID;

  @override
  Widget build(BuildContext context) {
    toInteger({required double amount}) {
      int amountInt = (amount * 100).toInt();
      return amountInt;
    }

    final paymentConfig = PaymentConfig(
      publishableApiKey: dotenv.env['MOYASAR_PK'].toString(),
      amount: toInteger(amount: amount), // SAR 257.58
      description: 'order #$orderID',
      metadata: {'size': '250g'},
      creditCard: CreditCardConfig(saveCard: false, manual: false),
    );
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: Builder(builder: (context) {
        final orderReadcubit = context.read<OrderCubit>();
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCard(
                      config: paymentConfig,
                      onPaymentResult: (PaymentResponse result) async {
                        if (result.status == PaymentStatus.paid) {
                          await orderReadcubit.addNewPayment(
                              paymentMethod: "MADA",
                              paymentStatus: "paid",
                              orderID: orderID,
                              transicitionID: result.id,
                              amount: amount.toDouble());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetailsScreen(
                                      billId: orderID,
                                    )),
                          );
                        }

                        if (result.status == PaymentStatus.failed) {
                          await orderReadcubit.addNewPayment(
                              paymentMethod: "MADA",
                              paymentStatus: "faild",
                              orderID: orderID,
                              transicitionID: result.id,
                              amount: amount.toDouble());
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
