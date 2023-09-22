import 'package:equatable/equatable.dart';
import 'package:redstar_management/models/models.dart';

class Order extends Equatable {
  final int? customerId;
  final List<String>? productIds;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final bool? isCancelled;
  final bool? isAccepted;
  final bool? isDelivered;
  final DateTime? createdAt;

  const Order(
      {this.customerId,
      this.productIds,
      this.subtotal,
      this.deliveryFee,
      this.total,
      this.isCancelled,
      this.isAccepted,
      this.isDelivered,
      this.createdAt});

  Map<String, Object> toDocument() {
    return {
      'customerId': customerId!,
      'productIds': productIds!, //.map((product) => product.id).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
      'isCancelled': isCancelled!,
      'isDelivered': isDelivered!,
      'isAccepted': isAccepted!,
      'createdAt': createdAt!
    };
  }

  @override
  List<Object?> get props => [
        customerId,
        productIds,
        subtotal,
        deliveryFee,
        total,
        isCancelled,
        isAccepted,
        isDelivered
      ];
}
