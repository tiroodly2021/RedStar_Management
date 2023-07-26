import 'package:flutter/material.dart';
import 'package:redstar_management/pages/widgets.dart';

import '../../models/models.dart';

class CatalogPage extends StatelessWidget {
  final Category category;

  static const String routeName = "/catalog";
  const CatalogPage({Key? key, required this.category}) : super(key: key);

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogPage(category: category));
  }

  @override
  Widget build(BuildContext context) {
    List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(
                  product: categoryProducts[index], widthFactor: 2.2),
            );
          })
      /* ProductCard(
        product: Product.products[0],
      ) */
      ,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
