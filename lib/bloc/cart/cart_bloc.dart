// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:redstar_management/models/models.dart';
import '../../models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on(_onCartStart);
    on(_onCartProductAdded);
    on(_onCartProductRemoved);
  }

  /*  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStarted) {
      yield* _mapCartStartToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartProductAddedToState(event, state);
    } else if (event is CartProductRemoved) {
      yield* _mapCartProductRemovedToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (e) {
      yield CartError();
    }
  }

  Stream<CartState> _mapCartProductAddedToState(
      CartProductAdded event, CartState state) async* {
    yield CartLoading();
    if (state is CartLoaded) {
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product)));
      } catch (e) {
        yield CartError();
      }
    }
  }

  Stream<CartState> _mapCartProductRemovedToState(
      CartProductRemoved event, CartState state) async* {
    yield CartLoading();
    if (state is CartLoaded) {
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)));
      } catch (e) {
        yield CartError();
      }
    }
  } */

  void _onCartStart(CartStarted event, Emitter<CartState> emit) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(CartLoading());
    try {
      emit(const CartLoaded());
    } catch (e) {
      emit(CartError());
    }
  }

  void _onCartProductAdded(
      CartProductAdded event, Emitter<CartState> emit) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    print("Add to cart check here! " + state.toString());

    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..add(event.product))));
      } catch (e) {
        emit(CartError());
      }
    }
  }

  void _onCartProductRemoved(
      CartProductRemoved event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(CartLoaded(
            cart: Cart(
                products: List.from((state as CartLoaded).cart.products)
                  ..remove(event.product))));
      } catch (e) {
        emit(CartError());
      }
    }
  }
}
