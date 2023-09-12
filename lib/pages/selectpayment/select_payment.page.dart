import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/models/payment_method.model.dart';

import '../../bloc/blocs.dart';
import '../../models/models.dart';
import '../widgets.dart';

class SelectPaymentPage extends StatelessWidget {
  static const String routeName = "/select-payment";

  const SelectPaymentPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SelectPaymentPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Select Payment"),
        body: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PaymentLoaded) {
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        context
                            .read<PaymentBloc>()
                            .add(const SelectPaymentMethodEvent(
                              paymentMethod: PaymentMethod.google_pay,
                            ));
                        Navigator.pushNamed(context, "/checkout");
                      },
                      child: const Text("Pay with G Pay")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        context.read<PaymentBloc>().add(
                            const SelectPaymentMethodEvent(
                                paymentMethod: PaymentMethod.paystack));

                        Navigator.pushNamed(context, "/checkout");
                      },
                      child: const Text("Pay with Pay stack"))
                ],
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ),
        bottomNavigationBar: CustomNavBar(page: routeName));
  }
}
