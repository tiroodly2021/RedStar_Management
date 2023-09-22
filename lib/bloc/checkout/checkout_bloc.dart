import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:redstar_management/bloc/cart/cart_bloc.dart';
import 'package:redstar_management/bloc/order/order_bloc.dart';
import 'package:redstar_management/bloc/payment/payment_bloc.dart';
import 'package:redstar_management/repositories/checkout/checkout.repositories.dart';
import 'package:redstar_management/repositories/orders/order.repositories.dart';

import '../../models/models.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  final PaymentBloc _paymentBloc;
  // final OrderBloc _orderBloc;
  final OrderRepository _orderRepository;

  StreamSubscription? _cartStreamSubscription;
  StreamSubscription? _checkoutStreamSubscription;
  StreamSubscription? _paymentStreamSubscription;
  StreamSubscription? _orderStreamSubscription;

  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository,
      required PaymentBloc paymentBloc,
      //required OrderBloc orderBloc,
      required OrderRepository orderRepository})
      : _paymentBloc = paymentBloc,
        _cartBloc = cartBloc,
        // _orderBloc = orderBloc,
        _checkoutRepository = checkoutRepository,
        _orderRepository = orderRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString)
            : CheckoutLoading()) {
    _cartStreamSubscription = _cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });

    _paymentStreamSubscription = _paymentBloc.stream.listen((state) {
      if (state is PaymentLoaded) {
        add(UpdateCheckout(paymentMethod: state.paymentMethod));
      }

/*       _orderStreamSubscription = _orderBloc.stream.listen((state) {
        if (state is OrderLoaded) {
          add(UpdateCheckout(order: state.order));
        }
      }); */
    });

    on(_onUpdateCheckout);
    on(_onConfirmCheckout);
  }

  @override
  Future<void> close() {
    _cartStreamSubscription?.cancel();
    _paymentStreamSubscription?.cancel();
//_checkoutStreamSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onUpdateCheckout(
      UpdateCheckout event, Emitter<CheckoutState> emit) {
    if (this.state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;

      emit(CheckoutLoaded(
          currentCheckoutEvent: event,
          fullName: event.fullName ?? state.fullName,
          email: event.email ?? state.email,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subtotal: event.cart?.subtotalString ?? state.subtotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
          paymentMethod: event.paymentMethod ?? state.paymentMethod));
    }
  }

  Future<FutureOr<void>> _onConfirmCheckout(
      ConfirmCheckout event, Emitter<CheckoutState> emit) async {
    _checkoutStreamSubscription?.cancel();

    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        await _orderRepository.addOrder(event.order!);

        print("Done");
        emit(CheckoutLoading());
      } catch (e) {
        print(e);
      }
    }
  }
}
