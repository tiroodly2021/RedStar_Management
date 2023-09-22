part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  OrderLoaded(
      {this.customerId,
      this.products,
      this.subtotal,
      this.deliveryFee,
      this.total,
      this.isCancelled,
      this.isAccepted,
      this.isDelivered,
      this.createdAt})
      : order = Order(
            customerId: customerId,
            productIds: products,
            subtotal: subtotal,
            deliveryFee: deliveryFee,
            total: total,
            isCancelled: isCancelled,
            isAccepted: isAccepted,
            isDelivered: isDelivered,
            createdAt: createdAt);

  final int? customerId;
  final String? deliveryFee;
  final bool? isAccepted;
  final bool? isCancelled;
  final bool? isDelivered;
  final Order order;
  final List<Product>? products;
  final String? subtotal;
  final String? total;
  final DateTime? createdAt;

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
        order,
        createdAt
      ];
}
