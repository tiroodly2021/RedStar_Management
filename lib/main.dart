import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_management/bloc/wishlist/wishlist_bloc.dart';
import 'package:redstar_management/config/app_router.dart';
import 'package:redstar_management/config/theme.dart';
import 'package:redstar_management/models/models.dart';
import "./pages/pages.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishlistBloc()..add(StartWishlist()),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          /* ThemeData(
              primarySwatch: Colors.blue,
            ), */
          home: const HomePage(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName),
    );
  }
}
