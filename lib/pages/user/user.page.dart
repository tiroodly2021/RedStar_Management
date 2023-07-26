import 'package:flutter/material.dart';
import 'package:redstar_management/pages/widgets.dart';

class UserPage extends StatelessWidget {
  static const String routeName = "/user";
  const UserPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const UserPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "User"),
      body: Center(child: Text("User")),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
