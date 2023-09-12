import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/category/category_bloc.dart';
import '../../bloc/product/product_bloc.dart';
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
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CategoryError) {
                      return const Text("Something went wrong");
                    } else if (state is CategoryLoaded) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                        items: state.categories
                            .map((category) =>
                                HeroCarouselCard(category: category))
                            .toList() /* Category.categories
                            .map((category) =>
                                HeroCarouselCard(category: category))
                            .toList() */
                        ,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              const SectionTitle(title: "RECOMMENDED"),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProductError) {
                    return const Text("Something went wrong");
                  } else if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SectionTitle(title: "MOST POPULAR"),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProductError) {
                    return const Text("Something went wrong");
                  } else if (state is ProductLoaded) {
                    return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList(),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
        bottomNavigationBar:
            CustomNavBar(page: routeName)); //const CustomBottomAppBar());
  }
}
