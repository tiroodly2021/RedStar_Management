import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redstar_management/pages/widgets.dart';

import '../../models/models.dart';
import '../pages.dart';

class OrderConfirmationPage extends StatelessWidget {
  static const String routeName = "/order-confirmation";
  const OrderConfirmationPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const OrderConfirmationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 300,
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 70,
                top: 100,
                child: SvgPicture.asset(
                  "assets/images/laptop.svg",
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                top: 250,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Your Order is completed",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ORDER CODE : #kdfsd-345',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Thank you for purchasing with Redstar-Hightech',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                Text(
                  'ORDER CODE : #kdfsd-345',
                  style: Theme.of(context).textTheme.headline5,
                ),
                OrderSummary(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ORDER DETAILS',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OrderSummaryProductCard(
                      product: Product.products[0],
                      quantity: 2,
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar:
          CustomNavBar(page: routeName) /* const CustomBottomAppBar() */,
    );
  }
}
