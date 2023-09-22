part of 'order_bloc.dart';

class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class UpdateOrderEvent extends OrderEvent {
  final int? customerId;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final bool? isCancelled;
  final bool? isAccepted;
  final bool? isDelivered;
  final DateTime? createdAt;

  const UpdateOrderEvent(
      {this.customerId,
      this.products,
      this.subtotal,
      this.deliveryFee,
      this.total,
      this.isCancelled,
      this.isAccepted,
      this.isDelivered,
      this.createdAt});
  // final Cart? cart;

  @override
  List<Object?> get props => [
        customerId,
        products,
        subtotal,
        deliveryFee,
        total,
        isCancelled,
        isAccepted,
        isDelivered,
        createdAt
      ];
}

class ConfirmOrderEvent extends OrderEvent {
  Order order;
  ConfirmOrderEvent({required this.order});

  @override
  List<Object?> get props => [order];
}
