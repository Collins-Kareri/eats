import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A c c o u n t"),
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
      body: const Center(child: Text("Account details")),
    );
  }
}
