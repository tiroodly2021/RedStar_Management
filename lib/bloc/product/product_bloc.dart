import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redstar_management/models/category.model.dart';
import 'package:redstar_management/models/product.model.dart';

import '../../repositories/products/product.repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on(_onLoadProducts);
    on(_onUpdateProducts);
  }

  FutureOr<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) {
    if (_productSubscription != null) {
      _productSubscription?.cancel();
    }

    _productSubscription =
        _productRepository.getAllProducts().listen((products) => add(
              UpdateProducts(products),
            ));
  }

  FutureOr<void> _onUpdateProducts(
      UpdateProducts event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }
}
