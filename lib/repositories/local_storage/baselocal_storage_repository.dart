import 'package:hive_flutter/hive_flutter.dart';
import 'package:redstar_management/models/models.dart';

abstract class BaselocalStorageRepository {
  Future<Box> openBox();
  List<Product> getWishlist(Box box);
  Future<void> addProductToWishlist(Box box, Product product);
  Future<void> RemoveProductToWishlist(Box box, Product product);
  Future<void> ClearProductToWishlist(Box box);
}
