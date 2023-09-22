import 'package:equatable/equatable.dart';
import 'package:redstar_management/models/models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final Order? order;

  const Checkout(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.city,
      required this.country,
      required this.deliveryFee,
      required this.products,
      required this.subtotal,
      required this.total,
      required this.zipCode,
      this.order});

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        deliveryFee,
        products,
        subtotal,
        total,
        zipCode,
        order
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;
    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }
}
