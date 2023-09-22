import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:redstar_management/models/Category.model.dart';

part 'product.model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String? imageUrl;
  @HiveField(5)
  final double price;
  @HiveField(6)
  final bool isRecommended;
  @HiveField(7)
  final bool isPopular;

  Product(
      {required this.id,
      required this.name,
      this.description,
      required this.category,
      this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  List<Object?> get props =>
      [id, name, category, imageUrl, price, isRecommended, isPopular];

  static Product fromSnapShot(DocumentSnapshot snapshot) {
    Product products = Product(
        id: snapshot.id, //['id'],
        name: snapshot['name'],
        description: snapshot['description'],
        category: snapshot["category"],
        imageUrl: snapshot["imageUrl"],
        price: snapshot["price"],
        isRecommended: snapshot["isRecommended"],
        isPopular: snapshot["isPopular"]);

    return products;
  }

  static final List<Product> products = [
    Product(
        id: "0",
        name: "First Product",
        category: "First Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 20,
        isRecommended: true,
        isPopular: false),
    Product(
        id: "1",
        name: "First Product",
        category: "First Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 20,
        isRecommended: true,
        isPopular: false),
    Product(
        id: "2",
        name: "Second Product",
        category: "Second Category",
        imageUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 45,
        isRecommended: true,
        isPopular: false),
    Product(
        id: "3",
        name: "Third Product",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 76,
        isRecommended: false,
        isPopular: true),
    Product(
        id: "4",
        name: "AXXXXX AXXX",
        category: "Second Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 12,
        isRecommended: false,
        isPopular: false),
    Product(
        id: "5",
        name: "Fourth Product",
        category: "Second Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 32,
        isRecommended: false,
        isPopular: false),
    Product(
        id: "6",
        name: "ewrwerewrv sdfsdf",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 45,
        isRecommended: true,
        isPopular: false),
    Product(
        id: "7",
        name: "Third Product",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 76,
        isRecommended: true,
        isPopular: true),
    Product(
        id: "8",
        name: "Third Product",
        category: "Third Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 76,
        isRecommended: false,
        isPopular: true),
    Product(
        id: "9",
        name: "asd sdfdsf",
        category: "sdfdf Category",
        imageUrl:
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        price: 32,
        isRecommended: true,
        isPopular: false),
  ];
}
