import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './../widgets.dart';
import '../../models/models.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/";
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Zero To Unicorn"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: Category.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                ),
              ),
              const SectionTitle(title: "RECOMMENDED"),
              ProductCarousel(
                products: Product.products
                    .where((product) => product.isRecommended)
                    .toList(),
              ),
              const SectionTitle(title: "MOST POPULAR"),
              ProductCarousel(
                products: Product.products
                    .where((product) => product.isPopular)
                    .toList(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomAppBar());
  }
}
