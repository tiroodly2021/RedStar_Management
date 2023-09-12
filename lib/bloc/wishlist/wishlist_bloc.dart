import 'dart:async';

import 'package:equatable/equatable.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on(_onStartWishlist);
    on(_onAddWishlistProduct);
    on(_onRemoveWishlistProduct);
  }

/*   @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishlistProductToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (e) {
      yield WishlistError(errorMessage: e.toString());
    }
  }

  Stream<WishlistState> _mapAddWishlistProductToState(
      AddWishlistProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        await Future<void>.delayed(const Duration(seconds: 1));
        print(event.product);
        yield WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..add(event.product)));
      } catch (e) {
        yield WishlistError(errorMessage: e.toString());
      }
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(
      RemoveWishlistProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        await Future<void>.delayed(const Duration(seconds: 1));

        yield WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..remove(event.product)));
      } catch (e) {
        yield WishlistError(errorMessage: e.toString());
      }
    }
  }
 */
  Future<FutureOr<void>> _onStartWishlist(
      StartWishlist event, Emitter<WishlistState> emit) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    emit(WishlistLoading());
    try {
      emit(const WishlistLoaded());
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }

  Future<FutureOr<void>> _onAddWishlistProduct(
      AddWishlistProduct event, Emitter<WishlistState> emit) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from((state as WishlistLoaded).wishlist.products)
                  ..add(event.product))));
      } catch (e) {
        emit(WishlistError(errorMessage: e.toString()));
      }
    }
  }

  Future<FutureOr<void>> _onRemoveWishlistProduct(
      RemoveWishlistProduct event, Emitter<WishlistState> emit) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from((state as WishlistLoaded).wishlist.products)
                  ..remove(event.product))));
      } catch (e) {
        emit(WishlistError(errorMessage: e.toString()));
      }
    }
  }
}
