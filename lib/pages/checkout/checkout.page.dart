import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/checkout/checkout_bloc.dart';
import 'package:redstar_management/models/models.dart';
import 'package:redstar_management/pages/widgets.dart';

import '../../bloc/payment/payment_bloc.dart';

class CheckoutPage extends StatelessWidget {
  static const String routeName = "/checkout";

  CheckoutPage({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CheckoutPage());
  }

  @override
  Widget build(BuildContext context) {
    /*  TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController zipController = TextEditingController(); */

    return Scaffold(
        appBar: const CustomAppBar(title: "Checkout"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(child:
              BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CUSTOMER INFORMATION",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField(const Icon(Icons.mail_outline), (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  }, context, 'Email'),
                  _buildTextFormField(const Icon(Icons.person), (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  }, context, 'Name'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "DELIVERY INFORMATION",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField(const Icon(Icons.location_history),
                      (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, 'Address'),
                  _buildTextFormField(const Icon(Icons.location_city), (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  }, context, 'City'),
                  _buildTextFormField(const Icon(Icons.location_city), (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  }, context, 'Country'),
                  _buildTextFormField(
                      const Icon(Icons.location_searching_outlined), (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  }, context, 'Zip'),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40),
                              primary: Colors.black),
                          onPressed: () {
                            Navigator.pushNamed(context, "/select-payment",
                                arguments: state.checkout);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("SELECT A PAYMENT METHOD",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.white)),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_sharp),
                                onPressed: () {},
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ORDER SUMMARY",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const OrderSummary()
                ],
              );
            } else {
              return const Center(
                child: Text("Something were wrong"),
              );
            }
          })),
        ),
        bottomNavigationBar: CustomNavBar(page: routeName));
  }

  Padding _buildTextFormField(Widget prefixIcon, Function(String)? onChanged,
      BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: Colors.white,
            labelText: labelText,
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(),
          ),
          /* decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(left: 10),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))
                   ) */
        ))
      ]),
    );
  }
}
