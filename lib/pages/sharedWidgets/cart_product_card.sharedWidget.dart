import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/cart/cart_bloc.dart';

import '../../models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container()
          /*  (product.imageUrl == null)
              ? Container()
              : Image.network(product.imageUrl!,
                  width: 100, height: 80, fit: BoxFit.cover,
                  loadingBuilder: (ctx, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    );
                  }
                }, errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                  print(exception.toString());
                  // Appropriate logging or analytics, e.g.
                  // myAnalytics.recordError(
                  //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                  //   exception,
                  //   stackTrace,
                  // );
                  return const Text('ð¢');
                }) */
          ,
          const SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "\$${product.name}",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "\$${product.price}",
              style: Theme.of(context).textTheme.headline6,
            )
          ]),
          const SizedBox(
            width: 20,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(product));
                        },
                        icon: const Icon(Icons.add_circle)),
                    Text(
                      "$quantity",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductRemoved(product));
                        },
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              } else {
                return const Text("Something went wrong");
              }
            },
          )
        ],
      ),
    );
  }
}
