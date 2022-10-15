import 'package:flutter/material.dart';
import 'package:firstapp/screens/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/cart_provider.dart';
import 'package:firstapp/providers/food_image_provider.dart';
import 'package:firstapp/providers/order_provider.dart';
import 'package:firstapp/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  ).copyWith(
      side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: Colors.black)));

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.grey,
    surfaceTintColor: Colors.grey,
    fixedSize: const Size.fromWidth(90.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 8.0,
    ),
    elevation: 4.0,
  );

  const CardTheme myCardTheme = CardTheme(
    elevation: 1.0,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black38),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
  );

  const DialogTheme myDialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black38),
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
    ),
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MyCart()),
      ChangeNotifierProvider(create: (_) => FoodImages()),
      ChangeNotifierProvider(create: (_) => MyOrders()),
      ChangeNotifierProvider(
        create: (_) => MyAccountDetails(),
      ),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cardTheme: myCardTheme,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        primarySwatch: Colors.blueGrey,
        dialogTheme: myDialogTheme,
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
