import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:redstar_management/repositories/repositories.dart';
import '../../models/models.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc(this.orderRepository) : super(OrderLoading()) {
    on<OrderEvent>((event, emit) {
      on(_onUpdateOrderEvent);
      on(_onConfirmOrder);
    });
  }

  FutureOr<void> _onUpdateOrderEvent(
      UpdateOrderEvent event, Emitter<OrderState> emit) {
    if (this.state is OrderLoaded) {
      final state = this.state as OrderLoaded;

      emit(OrderLoaded(
          customerId: event.customerId ?? state.customerId,
          products: event.products ?? state.products,
          subtotal: event.subtotal ?? state.subtotal,
          total: event.total ?? event.total,
          deliveryFee: event.deliveryFee ?? state.deliveryFee,
          isCancelled: event.isCancelled ?? state.isCancelled,
          isAccepted: event.isAccepted ?? state.isAccepted,
          isDelivered: event.isDelivered ?? state.isDelivered,
          createdAt: event.createdAt ?? state.createdAt));
    }
  }

  Future<FutureOr<void>> _onConfirmOrder(
      ConfirmOrderEvent event, Emitter<OrderState> emit) async {
    if (state is OrderLoaded) {
      try {
        //await orderRepository.addOrder(event.order);
        print("Done");
        emit(OrderLoading());
      } catch (e) {
        print(e);
      }
    }
  }
}
