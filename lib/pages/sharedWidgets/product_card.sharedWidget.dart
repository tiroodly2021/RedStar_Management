import 'package:flutter/material.dart';
import '../../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const ProductCard(
      {Key? key,
      required this.product,
      this.leftPosition = 5,
      this.widthFactor = 2.5,
      this.isWishList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double withValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product", arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: withValue - 5 - leftPosition,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: withValue - 15 - leftPosition,
              height: 70,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "\$${product.price}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          )
                        ]),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(Icons.add_circle)),
                    ),
                    isWishList
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {},
                                color: Colors.white,
                                icon: const Icon(Icons.delete)),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
