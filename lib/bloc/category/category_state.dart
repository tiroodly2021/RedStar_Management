part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  List<Category> categories;

  CategoryLoaded({this.categories = const <Category>[]});

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {}
