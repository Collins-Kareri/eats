import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/order_provider.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final myOrders = context.watch<MyOrders>().allOrders;

    return myOrders.isNotEmpty
        ? OrderDisplay(myOrders)
        : const Center(
            child: Text("no orders have been made"),
          );
  }
}

class OrderDisplay extends StatelessWidget {
  late final List _orders;

  OrderDisplay(List myOrders, {super.key}) {
    _orders = myOrders;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.bike_scooter_outlined),
          title: const Text('On the way'),
          subtitle: Text('To: ${_orders[index]["location"]}'),
          trailing: const Text('Estimated 5 mins'),
          isThreeLine: true,
        );
      },
    );
  }
}
