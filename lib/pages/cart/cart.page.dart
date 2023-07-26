import 'package:flutter/material.dart';
import 'package:redstar_management/pages/widgets.dart';

class CartPage extends StatelessWidget {
  static const String routeName = "/cart";
  const CartPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Cart"),
      body: Center(child: Text("Cart")),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
