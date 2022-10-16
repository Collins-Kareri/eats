import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eats/providers/cart_provider.dart';
import 'package:eats/providers/food_image_provider.dart';

class CartItemCard extends StatelessWidget {
  late final List _cartItems;

  final ButtonStyle cartItemButtonStyle = IconButton.styleFrom(
    foregroundColor: Colors.black,
    elevation: 1.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6.0),
      ),
      side: BorderSide(color: Colors.black),
    ),
  );

  CartItemCard(List cartItems, {super.key}) {
    _cartItems = cartItems;
  }

  @override
  Widget build(BuildContext context) {
    final editCart = context.read<MyCart>();
    final foodImage = context.read<FoodImages>();

    return Expanded(
      child: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final coverImg = foodImage.getImage(_cartItems[index]["foodname"]);

          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  coverImg,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.medium,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    _cartItems[index]["foodname"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    _cartItems[index]["price"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
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
