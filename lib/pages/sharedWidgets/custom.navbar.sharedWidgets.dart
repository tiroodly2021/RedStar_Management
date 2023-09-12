import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:redstar_management/bloc/checkout/checkout_bloc.dart';
import 'package:redstar_management/models/checkout.model.dart';
import 'package:redstar_management/models/models.dart';
import 'package:redstar_management/pages/sharedWidgets/google_pay.dart';
import 'package:redstar_management/pages/sharedWidgets/paystack.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/wishlist/wishlist_bloc.dart';
import '../../models/product.model.dart';

class CustomNavBar extends StatelessWidget {
  final String page;
  final Product? product;

  CustomNavBar({Key? key, required this.page, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
          height: 70,
          child: _selectNavBar(context,
              page) /*(page == '/product')
            ? AddToCartNavBar(product: product!)
            : (page == '/cart')
                ? const GoToCheckoutNavBar()
                : (page == '/checkout')
                    ? Text(
                        "OrderNavBar",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ) /* OrderNowNavBar() */
                    : const HomeNavBar(),*/
          ),
    );
  }

  Widget? _selectNavBar(context, page) {
    switch (page) {
      case "/":
        return _buildNavBar(context);
      case "/catalog":
        return _buildNavBar(context);
      case "/wishlist":
        return _buildNavBar(context);
      case "/order-confirmation":
        return _buildNavBar(context);
      case "/product":
        return _buildNavBarAddToCart(context, product);

      case "/cart":
        return _buildGoToCheckoutNavBar(context);

      case "/checkout":
        return OrderNowNavBar(); //_buildGoToOrderNowNavBar(context);

      case "/select-payment":
        return _buildNavBar(context);

      default:
        return _buildNavBar(context);
    }
  }

  Widget _buildGoToCheckoutNavBar(context) {
    return const GoToCheckoutNavBar();
  }

  Widget _buildNavBarAddToCart(context, product) {
    return AddToCartNavBar(product: product);
  }

  Widget _buildNavBar(context) {
    return const HomeNavBar();
  }

  /*  Widget _buildGoToOrderNowNavBar(context) {
    return const OrderNowNavBar();
  } */
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
        )
      ],
    );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WishlistLoaded) {
              return IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to your Wishlist!'),
                    ),
                  );
                  context.read<WishlistBloc>().add(AddWishlistProduct(product));
                },
              );
            }
            return const Text('Something went wrong!');
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CartLoaded) {
              return ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product));
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(),
                ),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            }
            return const Text('Something went wrong!');
          },
        ),
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          child: Text(
            'GO TO CHECKOUT',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}

class OrderNowNavBar extends StatelessWidget {
  int amount;
  String message;

  OrderNowNavBar({Key? key, this.amount = 0, this.message = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state2) {
            if (state2 is CheckoutLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state2 is CheckoutLoaded) {
              /* return Center(
                child: Text(
                  "Name is: ${state.paymentMethod.name}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
              ); */

              switch (state2.paymentMethod) {
                case PaymentMethod.google_pay:
                  return GooglePay(
                      products: state2.products!, total: state2.total!);
                case PaymentMethod.paystack:
                  return PayStack(onchanged: () async {
                    final charge = Charge()
                      ..email = state2.email
                      ..amount = amount
                      ..reference =
                          'ref_${DateTime.now().millisecondsSinceEpoch}';
                    final res =
                        await PaystackClient.checkout(context, charge: charge);

                    if (res.status) {
                      message = 'Charge was successful. Ref: ${res.reference}';
                    } else {
                      message = 'Failed: ${res.message}';
                    }
                  });
                default:
                  return PayStack(onchanged: () async {
                    final charge = Charge()
                      ..email = state2.email
                      ..amount = amount
                      ..reference =
                          'ref_${DateTime.now().millisecondsSinceEpoch}';
                    final res =
                        await PaystackClient.checkout(context, charge: charge);

                    if (res.status) {
                      message = 'Charge was successful. Ref: ${res.reference}';
                    } else {
                      message = 'Failed: ${res.message}';
                    }
                  });
              }

/* 
                  ElevatedButton(
                onPressed: () {
                  context
                      .read<CheckoutBloc>()
                      .add(ConfirmCheckout(checkout: state.checkout));

                  Navigator.pushNamed(context, '/order-confirmation');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(),
                ),
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ) */

            } else {
              return const Text("Something were wrong");
            }
          },
        ),
      ],
    );
  }
}


/*class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("Checkout!")
         BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is CheckoutLoaded) {
              if (state.paymentMethod == PaymentMethod.credit_card) {
                return Container(
                  child: Text(
                    'Pay with Credit Card',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                );
              }
              if (Platform.isAndroid &&
                  state.paymentMethod == PaymentMethod.google_pay) {
                return GooglePay(
                  products: state.products!,
                  total: state.total!,
                );
              }
              if (Platform.isIOS &&
                  state.paymentMethod == PaymentMethod.apple_pay) {
                return ApplePay(
                  products: state.products!,
                  total: state.total!,
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment-selection');
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'CHOOSE PAYMENT',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
              }
            } else {
              return Text('Something went wrong');
            }
          },
        ), 
      ],
    );
  }
}*/
