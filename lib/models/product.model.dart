import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:redstar_management/models/Category.model.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular, products];

  static Product fromSnapShot(DocumentSnapshot snapshot) {
    Product products = Product(
        name: snapshot['name'],
        category: snapshot["category"],
        imageUrl: snapshot["imageUrl"],
        price: snapshot["price"],
        isRecommended: snapshot["isRecommended"],
        isPopular: snapshot["isPopular"]);

    return products;
  }

  static final List<Product> products = [
    Product(
        name: "First Product",
        category: "First Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 20,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Second Product",
        category: "Second Category",
        imageUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 45,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Third Product",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 76,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "AXXXXX AXXX",
        category: "Second Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 12,
        isRecommended: false,
        isPopular: false),
    Product(
        name: "Fourth Product",
        category: "Second Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 32,
        isRecommended: false,
        isPopular: false),
    Product(
        name: "ewrwerewrv sdfsdf",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 45,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Third Product",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 76,
        isRecommended: true,
        isPopular: true),
    Product(
        name: "Third Product",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 76,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "asd sdfdsf",
        category: "sdfdf Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 32,
        isRecommended: true,
        isPopular: false),
  ];
}
