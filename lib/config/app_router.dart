import 'package:flutter/material.dart';
import 'package:redstar_management/pages/checkout/checkout.page.dart';
import 'package:redstar_management/pages/order/order_confirmation.page.dart';
import 'package:redstar_management/pages/selectpayment/select_payment.page.dart';

import '../models/models.dart';
import '../pages/pages.dart';
import "../pages/widgets.dart";

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print("This is route: ${settings.name}");

    switch (settings.name) {
      case "/":
        return HomePage.route();

      // ignore: no_duplicate_case_values
      case HomePage.routeName:
        return HomePage.route();

      // ignore: no_duplicate_case_values
      case CartPage.routeName:
        return CartPage.route();

      // ignore: no_duplicate_case_values
      case CatalogPage.routeName:
        return CatalogPage.route(category: settings.arguments as Category);

      // ignore: no_duplicate_case_values
      case ProductPage.routeName:
        return ProductPage.route(product: settings.arguments as Product);

      // ignore: no_duplicate_case_values
      case WishListPage.routeName:
        return WishListPage.route();

      // ignore: no_duplicate_case_values
      case UserPage.routeName:
        return UserPage.route();

      case SplashPage.routeName:
        return SplashPage.route();

      case CheckoutPage.routeName:
        return CheckoutPage.route();

      case OrderConfirmationPage.routeName:
        return OrderConfirmationPage.route();

      case SelectPaymentPage.routeName:
        return SelectPaymentPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/error"),
        builder: (_) => const Scaffold(
              appBar: CustomAppBar(title: "Page Not Found"),
              body: Center(child: Text("Error!")),
            ));
  }
}
