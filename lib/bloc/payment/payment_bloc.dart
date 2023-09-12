import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:redstar_management/bloc/checkout/checkout_bloc.dart';
import 'package:redstar_management/models/checkout.model.dart';
import 'package:redstar_management/models/payment_method.model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentLoading()) {
    on(_onLoadPaymentMethodEvent);
    on(_onSelectPaymentMethodEvent);
  }

/*   @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is LoadPaymentMethodEvent) {
      yield* _mapLoadPaymentMethodToState();
    } else if (event is SelectPaymentMethodEvent) {
      yield* _mapSelectPaymentMethodToState(event);
    }
  }

  Stream<PaymentState> _mapLoadPaymentMethodToState() async* {
    yield PaymentLoaded();
  }

  Stream<PaymentState> _mapSelectPaymentMethodToState(
      SelectPaymentMethodEvent event) async* {
    print("Payment method in the payment bloc noted state: " +
        event.paymentMethod.toString());

    yield PaymentLoaded(
        paymentMethod: event.paymentMethod, currentPaymentEvent: event);
  } */

  @override
  Future<void> close() {
    return super.close();
  }

  FutureOr<void> _onLoadPaymentMethodEvent(
      LoadPaymentMethodEvent event, Emitter<PaymentState> emit) {
    emit(PaymentLoaded());
  }

  FutureOr<void> _onSelectPaymentMethodEvent(
      SelectPaymentMethodEvent event, Emitter<PaymentState> emit) {
    emit(PaymentLoaded(
        paymentMethod: event.paymentMethod, currentPaymentEvent: event));
  }
}
