import '../../models/models.dart';

abstract class BaseOrderRepository {
  Future<void> addOrder(Order order);
}
