part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final PaymentMethod paymentMethod;
  PaymentEvent? currentPaymentEvent;

  PaymentLoaded(
      {this.paymentMethod = PaymentMethod.paystack, this.currentPaymentEvent});

  @override
  List<Object> get props => [paymentMethod];
}
