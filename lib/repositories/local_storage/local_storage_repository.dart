import 'package:redstar_management/models/product.model.dart';
import 'package:hive/hive.dart';
import 'package:redstar_management/repositories/local_storage/baselocal_storage_repository.dart';

class LocalStorageRepository extends BaselocalStorageRepository {
  String boxName = "wishlist_products";

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Product>(boxName);
    return box;
  }

  @override
  List<Product> getWishlist(Box box) {
    return box.values.toList() as List<Product>;
  }

  @override
  Future<void> addProductToWishlist(Box box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> RemoveProductToWishlist(Box box, Product product) async {
    await box.delete(product.id);
  }

  @override
  Future<void> ClearProductToWishlist(Box box) async {
    await box.clear();
  }
}
