import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C a r t"),
        backgroundColor: Colors.grey[50],
        foregroundColor: Colors.grey[600],
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 28.0,
            icon: const Icon(Icons.arrow_back_rounded)),
      ),
      body: const Center(child: Text("carts items")),
    );
  }
}
