import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:redstar_management/models/category.model.dart';
import 'package:redstar_management/repositories/categories/category.repositories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on(_onUpdateCategory);
    on(_onLoadCategory);
  }

  // @override
  // Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
  //   if (event is LoadCategories) {
  //     yield* _mapLoadCategoriesToState();
  //   } else if (event is UpdateCategories) {
  //     yield* _mapUpdateCategoriesToState(event);
  //   }
  // }

  /*Stream<CategoryState> _mapLoadCategoriesToState() async* {
    if (_categorySubscription != null) {
      _categorySubscription?.cancel();
    }

    _categorySubscription =
        _categoryRepository.getAllCategories().listen((categories) => add(
              UpdateCategories(categories),
            ));

    // yield CategoryLoading();
  }*/

  /*void _mapUpdateCategoriesToState(UpdateCategories event) {
    emit(CategoryLoaded(categories: event.categories));
  } */

  FutureOr<void> _onUpdateCategory(
      UpdateCategories event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }

  FutureOr<void> _onLoadCategory(
      LoadCategories event, Emitter<CategoryState> emit) {
    if (_categorySubscription != null) {
      _categorySubscription?.cancel();
    }

    _categorySubscription =
        _categoryRepository.getAllCategories().listen((categories) => add(
              UpdateCategories(categories),
            ));

    emit(CategoryLoading());
  }
}
