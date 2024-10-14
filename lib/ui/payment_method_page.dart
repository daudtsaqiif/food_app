part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key, required this.paymentURL});

  final String paymentURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IlustrationPage(
        title: 'Finish Your Payment',
        subtitle: 'Please select your favorite\npayment method',
        picturepath: 'assets/Payment.png',
        buttontitle1: 'Payment Method',
        buttontap1: () async {
          await launch(paymentURL);
        },
        buttontitle2: 'Continue',
        buttontap2: () {
          Get.to(SuccessOrderPage());
        },
      ),
    );
  }
}
