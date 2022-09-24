import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/cart_provider.dart';

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
        children: const [
          CartItems(),
          OrderButton(),
        ],
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MyCart(),
      child: Builder(builder: (context) {
        final cartItems = context.watch<MyCart>().cartItems;
        return cartItems.isNotEmpty
            ? DisplayCartItem(cartItems)
            : const CartEmptyState();
      }),
    );
  }
}

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(child: Text("cart is empty")));
  }
}

class DisplayCartItem extends StatelessWidget {
  late final List _cartItems;

  DisplayCartItem(List cartItems, {super.key}) {
    _cartItems = cartItems;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text(_cartItems[index]["foodName"]),
              Text(_cartItems[index]["price"]),
            ],
          ),
        );
      },
    );
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            fixedSize: const Size.fromWidth(90.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 16.0,
            ),
            elevation: 4.0,
          ),
          child: const Text(
            "Place order",
          ),
        ),
      ),
    );
  }
}
