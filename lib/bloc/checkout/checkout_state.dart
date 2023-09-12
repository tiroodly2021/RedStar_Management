part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
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
  final Checkout checkout;
  final PaymentMethod paymentMethod;
  CheckoutEvent? currentCheckoutEvent;

  CheckoutLoaded(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.deliveryFee,
      this.products,
      this.subtotal,
      this.total,
      this.zipCode,
      this.paymentMethod = PaymentMethod.paystack,
      this.currentCheckoutEvent})
      : checkout = Checkout(
            fullName: fullName,
            email: email,
            address: address,
            city: city,
            country: country,
            deliveryFee: deliveryFee,
            products: products,
            subtotal: subtotal,
            total: total,
            zipCode: zipCode);

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
        paymentMethod
      ];
}

class CheckoutError extends CheckoutState {}
