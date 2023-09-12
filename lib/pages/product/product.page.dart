import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/wishlist/wishlist_bloc.dart';
import 'package:redstar_management/pages/widgets.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../models/product.model.dart';

class ProductPage extends StatelessWidget {
  static const String routeName = "/product";
  Product product;

  ProductPage({Key? key, required this.product}) : super(key: key);

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductPage(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: [
                HeroCarouselCard(
                  product: product,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Colors.black.withAlpha(50)),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white)),
                            Text("\$${product.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white))
                          ]),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "Product Details",
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(
                    title: Text(
                        "Lorem  sdfsdf sdfdsfsdfs dsfd sfdsf dsf dsf dffsdfds fs fdsdf sdf df dsf sdfsd fdsf sdfs dfsd",
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "Delivery Information",
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(
                    title: Text(
                        "Lorem  sdfsdf sdfdsfsdfs dsfd sfdsf dsf dsf dffsdfds fs fdsdf sdf df dsf sdfsd fdsf sdfs dfsd",
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavBar(
          page: routeName,
          product: product,
        ));
  }
}
