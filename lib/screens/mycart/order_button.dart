import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eats/providers/order_provider.dart';
import 'package:eats/providers/cart_provider.dart';
import 'package:eats/screens/home/home_page.dart';

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  final myInputController = TextEditingController();

  void navigateToOrders(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return HomePage(
          index: 1,
        );
      }),
    );
  }

  Future placeOrder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          titlePadding: const EdgeInsets.only(
            top: 16.0,
            bottom: 8.0,
            left: 24.0,
            right: 24.0,
          ),
          contentPadding: const EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 24.0,
            right: 24.0,
          ),
          title: const Text('Please enter your location.'),
          children: [
            Column(
              children: [
                TextField(
                  controller: myInputController,
                  decoration: const InputDecoration(
                    labelText: 'Enter location',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context, {'action': 'close'});
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (myInputController.text.isNotEmpty) {
                            Navigator.pop(context, {
                              'action': 'submit',
                              'payload': {
                                'orderId': 'orderId',
                                'location': myInputController.text,
                              }
                            });
                          } else {
                            return;
                          }
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(8.0)),
                        ),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> handleEnterLocationDialog(
      Future dialog, BuildContext context, MyOrders myOrders) async {
    final Map dialogResponse = await dialog as Map;
    switch (dialogResponse['action']) {
      case "close":
        break;
      case "submit":
        myOrders.addOrder(dialogResponse['payload']);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                  'Order successful. I hope you will enjoy the food.'),
              content: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  navigateToOrders(context);
                },
                child: const Text('Ok'),
              ),
            );
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final myOrders = context.read<MyOrders>();
    final myCart = context.watch<MyCart>().cartItems;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: ElevatedButton(
            onPressed: () {
              if (myCart.isEmpty) {
                return;
              }

              handleEnterLocationDialog(placeOrder(context), context, myOrders);
            },
            child: const Text(
              "Place order",
            ),
          ),
        ),
      ),
    );
  }
}
