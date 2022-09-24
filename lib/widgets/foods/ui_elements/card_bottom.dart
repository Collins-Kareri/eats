import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/cart_provider.dart';

class CardBottom extends StatelessWidget {
  late final String _price;
  late final String _foodname;

  CardBottom(price, foodname, {super.key}) {
    _price = price;
    _foodname = foodname;
  }

  void _handleAddToCart(BuildContext context) {
    context.read<MyCart>().addItem({'foodName': _foodname, 'price': _price});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_foodname added to cart.'),
        duration: const Duration(milliseconds: 8000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(_foodname,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_price),
              OutlinedButton(
                onPressed: (() => _handleAddToCart(context)),
                child: const Text("Add to cart"),
              )
            ],
          )
        ],
      ),
    );
  }
}
