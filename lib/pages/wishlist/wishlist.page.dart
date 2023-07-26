import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/wishlist/wishlist_bloc.dart';
import 'package:redstar_management/pages/widgets.dart';

import '../../models/models.dart';

class WishListPage extends StatelessWidget {
  static const String routeName = "/wishList";
  const WishListPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Your Wishlist"),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistError) {
            return Center(
              child: Text(
                "Something went wrong",
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else if (state is WishlistLoaded) {
            if (state.wishlist.products.isEmpty) {
              return const ListNotFound();
            }

            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.4),
                itemCount: state.wishlist.products.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ProductCard(
                      leftPosition: 100,
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      isWishList: true,
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
