import 'package:flutter/material.dart';

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
              foregroundColor: Colors.black,
              backgroundColor: Colors.blueGrey,
              surfaceTintColor: Colors.blueGrey,
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
