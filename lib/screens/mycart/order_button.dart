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
            onPressed: () {
              showDialog(
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
                          const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter location',
                              isDense: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
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
