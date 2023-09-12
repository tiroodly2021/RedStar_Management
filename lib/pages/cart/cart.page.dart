import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/cart/cart_bloc.dart';
import 'package:redstar_management/pages/widgets.dart';

import '../../models/models.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(title: "Cart"),
      body: BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
        print("The state is: " + state.toString());

        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cart.freeDeliveryString,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const RoundedRectangleBorder(),
                                elevation: 0),
                            onPressed: () {
                              Navigator.pushNamed(context, "");
                            },
                            child: Text(
                              "Add more Items",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemCount: state.cart.products.length,
                          itemBuilder: ((context, index) {
                            // print(state.cart.products);

                            //print(state.cart
                            //     .productQuantity(state.cart.products));
                            return CartProductCard(
                                product: state.cart.products[index],
                                /*state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),*/
                                quantity:
                                    1 /* state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index), */
                                );
                          })),
                    )
                  ],
                ),
                const OrderSummary()
              ],
            ),
          );
        } else if (state is CartError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else {
          return Container();
        }
      })),
      bottomNavigationBar: CustomNavBar(
          page:
              routeName) /* BottomAppBar(
          color: Colors.black,
          child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      child: Text(
                        "GO TO CHECKOUT",
                        style: Theme.of(context).textTheme.headline3,
                      ))
                ],
              ))) */
      ,
    );
  }
}
