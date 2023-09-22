import 'package:flutter/material.dart';
import 'package:redstar_management/bloc/checkout/checkout_bloc.dart';
import 'package:redstar_management/bloc/order/order_bloc.dart';
import 'package:redstar_management/helpers/var_pass.dart';
import 'package:redstar_management/pages/google_simulation/google_simulation.dart';

import '../../models/models.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GooglePay extends StatelessWidget {
  GooglePay(
      {Key? key,
      required this.products,
      required this.total,
      required this.checkout,
      required this.order})
      : super(key: key);

  final Checkout checkout;
  final Order order;
  final List<Product> products;
  final String total;
  TextEditingController txtEditController = TextEditingController();

  void onGooglePaymentResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  _openPopup(context, Checkout checkout) {
    Alert(
        context: context,
        title: "Enter Card Number",
        content: Column(
          children: <Widget>[
            TextField(
              controller: txtEditController,
              decoration: const InputDecoration(
                //icon: Icon(Icons.account_circle),
                labelText: 'Card Number',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 4),
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.black,
            height: 50,
            onPressed: () {
              print("printable value is: " + txtEditController.text);
              //Navigator.pop(context);
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
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
            onPressed: () {
              /*  Navigator.pushNamed(context, GoogleSimulationPage.routeName,
                  arguments: checkout.address); */
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                //  print(checkout);
                // print(order);

                return GoogleSimulationPage(
                  order: order,
                  checkout: checkout,
                );
              }));
            },
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
