part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You desrve better meal',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //header
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Item Order',
                  style: blackFontStyle3.copyWith(fontSize: 16),
                ),
                SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(transaction.food!.picturePath!),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189,
                          child: Text(
                            transaction.food!.name!,
                            style: blackFontStyle2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'IDR',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(transaction.food!.price),
                          style: blackFontStyle2,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${transaction.quantity} item(s)',
                        textAlign: TextAlign.end,
                        style: greyFontStyle.copyWith(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                //Details transaction
                Text(
                  'Details Transaction',
                  style: blackFontStyle3.copyWith(fontSize: 16),
                ),
                SizedBox(height: 12),
                //Nama makanan
                Row(
                  children: [
                    Text(
                      transaction.food!.name!,
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                          .format(transaction.food!.price),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                //Quantity
                Row(
                  children: [
                    Text(
                      "Quantity",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text('${transaction.quantity.toString()} item(s)'),
                  ],
                ),
                SizedBox(height: 12),
                //Sub Total
                Row(
                  children: [
                    Text(
                      "Sub Total",
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                          .format(
                              transaction.food!.price! * transaction.quantity!),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(height: 12),
                //Tax
                Row(
                  children: [
                    Text(
                      'Tax 10%',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                          .format(transaction.food!.price! *
                              transaction.quantity! *
                              0.1),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                //Driver
                Row(
                  children: [
                    Text(
                      'Driver',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                          .format(50000),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(height: 12),
                //total harga
                Row(
                  children: [
                    Text(
                      'Total',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                          .format(
                        transaction.total,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Deliver to:',
                  style: blackFontStyle3,
                ),
                SizedBox(height: 12),
                //Nama Penerima
                Row(
                  children: [
                    Text(
                      'Nama Penerima:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(transaction.user!.name!),
                  ],
                ),
                SizedBox(height: 12),
                //Email Penerima
                Row(
                  children: [
                    Text(
                      'Email Penerima:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(transaction.user!.email!),
                  ],
                ),
                SizedBox(height: 12),
                //Phone Number
                Row(
                  children: [
                    Text(
                      'Phone Number:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(transaction.user!.phoneNumber!),
                  ],
                ),
                SizedBox(height: 12),
                //Address
                Row(
                  children: [
                    Text(
                      'Address',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(transaction.user!.address!),
                  ],
                ),
                SizedBox(height: 12),
                //HouseNumber
                Row(
                  children: [
                    Text(
                      'House NUmber:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(transaction.user!.houseNumber!),
                  ],
                ),
                SizedBox(height: 12),
                //City
                Row(
                  children: [
                    Text(
                      'City:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(transaction.user!.city!),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
