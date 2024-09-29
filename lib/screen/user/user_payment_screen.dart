import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';

class UserPaymentScreen extends StatelessWidget {
  UserPaymentScreen({super.key});

  final paymentConfig = PaymentConfig(
    
    publishableApiKey: 'YOUR_API_KEY',
    amount: 25758, // SAR 257.58
    description: 'order #1324',
    metadata: {'size': '250g'},
    creditCard: CreditCardConfig(saveCard: false, manual: false),
    applePay: ApplePayConfig(
        merchantId: 'YOUR_MERCHANT_ID',
        label: 'YOUR_STORE_NAME',
        manual: false),
  );

  void onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          // handle success.
          break;
        case PaymentStatus.failed:
          // handle failure.
          break;
        case PaymentStatus.initiated:
        // TODO: Handle this case.
        case PaymentStatus.authorized:
        // TODO: Handle this case.
        case PaymentStatus.captured:
        // TODO: Handle this case.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CreditCard(
                  config: paymentConfig,
                  onPaymentResult: onPaymentResult,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
