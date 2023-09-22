import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:redstar_management/models/models.dart';
import 'package:redstar_management/repositories/repositories.dart';

class OrderRepository extends BaseOrderRepository {
  final cloud_firestore.FirebaseFirestore _firebaseFirestore;

  OrderRepository({cloud_firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? cloud_firestore.FirebaseFirestore.instance;

  @override
  Future<void> addOrder(Order order) {
    return _firebaseFirestore.collection("orders").add(order.toDocument());
  }
}
