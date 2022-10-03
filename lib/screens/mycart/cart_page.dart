import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/cart_provider.dart';
import 'package:firstapp/screens/mycart/order_button.dart';
import 'package:firstapp/screens/mycart/emptycart_state.dart';
import 'package:firstapp/screens/mycart/cartitem_card.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C a r t"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 28.0,
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Column(
        children: [
          const CartPageBody(),
          Column(
            children: [
              const TotalPrice(),
              OrderButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class CartPageBody extends StatelessWidget {
  const CartPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<MyCart>().cartItems;

    return cartItems.isNotEmpty
        ? CartItemCard(cartItems)
        : const EmptyCartState();
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = context.watch<MyCart>().total;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ksh. $total',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
