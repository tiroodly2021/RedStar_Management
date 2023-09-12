import 'package:flutter/material.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';

class PayStack extends StatelessWidget {
  Future<void> Function()? onchanged;

  PayStack({Key? key, this.onchanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 150,
      child: ElevatedButton(
        onPressed: onchanged,
        child: const Text('Checkout'),
      ),
    );
  }
}
