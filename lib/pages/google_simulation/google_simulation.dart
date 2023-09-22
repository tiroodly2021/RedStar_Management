import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/checkout/checkout_bloc.dart';
import 'package:redstar_management/bloc/wishlist/wishlist_bloc.dart';
import 'package:redstar_management/config/app_router.dart';
import 'package:redstar_management/helpers/var_pass.dart';
import 'package:redstar_management/pages/home/home.page.dart';
import 'package:redstar_management/pages/widgets.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/order/order_bloc.dart';
import '../../models/models.dart';
import '../../models/product.model.dart';

class GoogleSimulationPage extends StatelessWidget {
  static const String routeName = "/google-simulation";

  final String? total;
  final List<Product>? products;
  TextEditingController txtEditController = TextEditingController();
  final Checkout? checkout;
  final Order? order;

  GoogleSimulationPage(
      {Key? key, this.checkout, this.order, this.total, this.products})
      : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => GoogleSimulationPage());
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Checkout;
    print(checkout);

    return Scaffold(
        appBar: const CustomAppBar(title: "Google Pay"),
        body:
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CheckoutLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: txtEditController,
                    decoration: const InputDecoration(
                      //icon: Icon(Icons.account_circle),
                      labelText: 'Card Number',
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        print("argument2: " + checkout.toString());
                        context.read<CheckoutBloc>().add(ConfirmCheckout(
                            checkout: checkout!, order: order!));
                        Navigator.pushNamed(context, HomePage.routeName);
                      },
                      child: const Text("Save"))
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        }),
        bottomNavigationBar: CustomNavBar(
          page: routeName,
        ));
  }
}
