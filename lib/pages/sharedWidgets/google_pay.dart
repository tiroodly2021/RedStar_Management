import 'package:flutter/material.dart';

import '../../models/models.dart';

class GooglePay extends StatelessWidget {
  final String total;
  final List<Product> products;
  GooglePay({Key? key, required this.products, required this.total})
      : super(key: key);

  void onGooglePaymentResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    /*  var _paymentItems = products
        .map((product) => PaymentItem(
            label: product.name,
            amount: product.price.toString(),
            type: PaymentItemType.item,
            status: PaymentItemStatus.final_price))
        .toList();

    _paymentItems.add(PaymentItem(
        label: "Total",
        amount: total,
        type: PaymentItemType.total,
        status: PaymentItemStatus.final_price)); */

    return SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        height: 200,
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width - 20, 40)),
            child: /*  GooglePayButton(
              paymentConfigurationAsset: "payment_profile_google_pay.json",
              paymentItems: _paymentItems,
              onPaymentResult: onGooglePaymentResult,
              type: GooglePayButtonType.buy,
              margin: const EdgeInsets.only(top: 8),
              loadingIndicator: const CircularProgressIndicator(),
            )  */
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.payments_outlined,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Google Pay!!!",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        )
        /* GooglePayButton(
          paymentConfigurationAsset: "payment_profile_google_pay.json",
          paymentItems: _paymentItems,
          onPaymentResult: onGooglePaymentResult,
          type: GooglePayButtonType.buy,
          margin: const EdgeInsets.only(top: 8),
          loadingIndicator: const CircularProgressIndicator(),
        ) */
        );
  }
}
