import 'package:flutter/material.dart';
import 'package:firstapp/screens/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/cart_provider.dart';
import 'package:firstapp/providers/food_image_provider.dart';
import 'package:firstapp/providers/order_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
  ).copyWith(
      side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: Colors.black)));

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.blueGrey,
    surfaceTintColor: Colors.blueGrey,
    fixedSize: const Size.fromWidth(90.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    padding: const EdgeInsets.only(
      top: 16.0,
      bottom: 16.0,
    ),
    elevation: 4.0,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MyCart()),
      ChangeNotifierProvider(create: (_) => FoodImages()),
      ChangeNotifierProvider(create: (_) => MyOrders()),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: elevatedButtonStyle),
        indicatorColor: Colors.black,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
        useMaterial3: true,
      ),
      home: HomePage(),
    ),
  ));
}
