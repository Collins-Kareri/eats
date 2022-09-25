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
        children: [
          const CartItems(),
          Column(
            children: const [
              TotalPrice(),
              OrderButton(),
            ],
          ),
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
    final cartItems = context.watch<MyCart>().cartItems;

    return cartItems.isNotEmpty
        ? CartItemDisplay(cartItems)
        : const EmptyCartState();
  }
}

class EmptyCartState extends StatelessWidget {
  const EmptyCartState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(child: Text("cart is empty")));
  }
}

class CartItemDisplay extends StatelessWidget {
  late final List _cartItems;

  final ButtonStyle cartItemButtonStyle = IconButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.blueGrey,
    surfaceTintColor: Colors.blueGrey,
    elevation: 2.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
  );

  CartItemDisplay(List cartItems, {super.key}) {
    _cartItems = cartItems;
  }

  @override
  Widget build(BuildContext context) {
    final editCart = context.read<MyCart>();

    return Expanded(
      child: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                surfaceTintColor: Colors.black,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              color: Colors.black,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_cartItems[index]["foodName"]),
                                Text(_cartItems[index]["price"]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (() =>
                                      editCart.reduceItemCount(index)),
                                  icon: const Icon(Icons.remove),
                                  style: cartItemButtonStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                  ),
                                  child: Text(_cartItems[index]["count"]),
                                ),
                                IconButton(
                                  onPressed: () => editCart.addItemCount(index),
                                  icon: const Icon(Icons.add),
                                  style: cartItemButtonStyle,
                                ),
                              ],
                            ),
                            OutlinedButton(
                              onPressed: () {
                                editCart.removeItem(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Item removed from cart.'),
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              child: const Text("remove"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FractionallySizedBox(
          widthFactor: 1,
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
      ),
    );
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
