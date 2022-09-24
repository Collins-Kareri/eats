import 'package:flutter/material.dart';
import 'package:firstapp/screens/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

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

  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
      indicatorColor: Colors.black,
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}
