import 'package:flutter/material.dart';

import '../../models/models.dart';

class OrderSummaryProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const OrderSummaryProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container()
          /* product.imageUrl == null
              ? Container()
              : Image.network(product.imageUrl!,
                
                  height: 80,
                  width: 100, loadingBuilder: (ctx, child, loadingProgress) {
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

                  return const Text('ð¢');
                }) ,*/
          ,
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Qty. $quantity',
              )
            ]),
          ),
          Expanded(
            child: Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}
