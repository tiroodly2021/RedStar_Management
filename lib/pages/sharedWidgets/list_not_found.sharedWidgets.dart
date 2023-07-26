import 'package:flutter/material.dart';

class ListNotFound extends StatelessWidget {
  const ListNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/empty.png",
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Your Wishlist is empty",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Text(
                  "Back To Shopping",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ]);
  }
}
