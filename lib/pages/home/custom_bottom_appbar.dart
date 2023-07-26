import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: const Icon(Icons.home)),
          IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "/user");
              },
              icon: const Icon(Icons.person))
        ]),
      ),
    );
  }
}
