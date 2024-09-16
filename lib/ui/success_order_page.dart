part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: 'You`ve Made Order',
      subtitle: 'Just stay at home while we are\n preparing your best foods',
      picturePath: 'assets/bike.png',
      buttonTitle1: 'Order Other Foods',
      buttonTap1: () {},
      buttonTitle2: 'View My Order',
      buttonTap2: () {},
    );
  }
}
