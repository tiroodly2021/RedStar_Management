import 'package:equatable/equatable.dart';
import 'package:redstar_management/models/models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Map productQuantity(List<Product> products) {
    var quantity = {};
    for (var product in products) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    }

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0;
    } else {
      return 10;
    }
  }

  String freeDelivery(double subtotal) {
    if (subtotal >= 0) {
      return "You have FREE delivery";
    } else {
      double missing = 30 - subtotal;
      return "Add ${missing.toStringAsFixed(2)} for FREE delivery";
    }
  }

  double total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
