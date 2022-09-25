import 'package:flutter/material.dart';

class EmptyCartState extends StatelessWidget {
  const EmptyCartState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(child: Text("cart is empty")));
  }
}
