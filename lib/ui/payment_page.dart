part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
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
                //header
                Row(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.transaction.food!.picturePath!),
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
                            widget.transaction.food!.name!,
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
                              .format(widget.transaction.food!.price),
                          style: blackFontStyle2,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${widget.transaction.quantity} item(s)',
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
                      widget.transaction.food!.name!,
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                              symbol: 'IDR', decimalDigits: 0, locale: 'id_ID')
                          .format(widget.transaction.food!.price),
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
                    Text('${widget.transaction.quantity.toString()} item(s)'),
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
                          .format(widget.transaction.food!.price! *
                              widget.transaction.quantity!),
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
                          .format(widget.transaction.food!.price! *
                              widget.transaction.quantity! *
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
                        widget.transaction.total,
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
                SizedBox(height: 10),
                //Nama Penerima
                Row(
                  children: [
                    Text(
                      'Nama Penerima:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.name!),
                  ],
                ),
                SizedBox(height: 10),
                //Email Penerima
                Row(
                  children: [
                    Text(
                      'Email Penerima:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.email!),
                  ],
                ),
                SizedBox(height: 10),
                //Phone Number
                Row(
                  children: [
                    Text(
                      'Phone Number:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.phoneNumber!),
                  ],
                ),
                SizedBox(height: 10),
                //Address
                Row(
                  children: [
                    Text(
                      'Address',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.address!),
                  ],
                ),
                SizedBox(height: 10),
                //HouseNumber
                Row(
                  children: [
                    Text(
                      'House NUmber:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.houseNumber!),
                  ],
                ),
                SizedBox(height: 10),
                //City
                Row(
                  children: [
                    Text(
                      'City:',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.city!),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  margin: EdgeInsets.only(top: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      bool result = await context
                          .read<TransactionCubit>()
                          .submitTransaction(
                            widget.transaction.copyWith(
                                dateTime: DateTime.now(),
                                total:
                                    (widget.transaction.total! * 1.1).toInt() +
                                        50000),
                          );
                      if (result) {
                        Get.to(SuccessOrderPage());
                      } else {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: 'D9435E'.toColor(),
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            'Transaction Failed',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          messageText: Text(
                            "Please try again",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Order Now',
                      style: blackFontStyle3.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
