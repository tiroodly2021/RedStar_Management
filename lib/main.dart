/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';

const String appName = 'Paystack Example';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PaystackClient.initialize("paystackPublicKey");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _email = '';
  int _amount = 0;
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Paystack Client Test'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) {
                _email = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                try {
                  _amount = (double.parse(val) * 100).toInt();
                } catch (e) {}
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _message = '';
                });

                final charge = Charge()
                  ..email = _email
                  ..amount = _amount
                  ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
                final res =
                    await PaystackClient.checkout(context, charge: charge);

                if (res.status) {
                  _message = 'Charge was successful. Ref: ${res.reference}';
                } else {
                  _message = 'Failed: ${res.message}';
                }
                setState(() {});
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:redstar_management/bloc/cart/cart_bloc.dart';
import 'package:redstar_management/bloc/category/category_bloc.dart';
import 'package:redstar_management/bloc/checkout/checkout_bloc.dart';
import 'package:redstar_management/bloc/payment/payment_bloc.dart';
import 'package:redstar_management/bloc/wishlist/wishlist_bloc.dart';
import 'package:redstar_management/config/app_router.dart';
import 'package:redstar_management/config/theme.dart';
import 'package:redstar_management/firebase_options.dart';
import 'package:redstar_management/models/models.dart';
import 'package:redstar_management/pages/checkout/checkout.page.dart';
import 'package:redstar_management/pages/order/order_confirmation.page.dart';
import 'package:redstar_management/repositories/categories/category.repositories.dart';
import 'package:redstar_management/repositories/checkout/checkout.repositories.dart';
import "./pages/pages.dart";
import 'bloc/product/product_bloc.dart';
import 'repositories/products/product.repositories.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  var firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PaystackClient.initialize("paystackPublicKey");

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
        ),
        BlocProvider(
          create: (context) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
            create: (context) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (context) =>
                ProductBloc(productRepository: ProductRepository())
                  ..add(LoadProducts())),
        BlocProvider(
            create: (context) => PaymentBloc()..add(LoadPaymentMethodEvent())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                paymentBloc: context.read<PaymentBloc>(),
                checkoutRepository: CheckoutRepository())),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          /* ThemeData(
              primarySwatch: Colors.blue,
            ), */
          home: /*  CheckoutPage(), */ const HomePage(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: /* CheckoutPage. */ SplashPage
              .routeName), //SplashPage.routeName),
    );
  }
}
