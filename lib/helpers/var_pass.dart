// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.

import 'package:redstar_management/models/models.dart';

class ScreenArguments {
  final Checkout checkout;
  final Order order;

  ScreenArguments(this.checkout, this.order);
}
