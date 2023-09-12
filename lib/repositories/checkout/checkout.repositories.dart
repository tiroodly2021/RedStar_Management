import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import 'base_checkout.repositories.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection("checkout").add(checkout.toDocument());
  }
}
