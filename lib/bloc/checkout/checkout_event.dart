part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;
  final PaymentMethod? paymentMethod;
  final Order? order;

  const UpdateCheckout(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.cart,
      this.paymentMethod,
      this.order});

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        cart,
        zipCode,
        paymentMethod,
        order
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  Checkout checkout;
  Order? order;

  ConfirmCheckout({required this.checkout, this.order});

  @override
  List<Object?> get props => [checkout];
}
