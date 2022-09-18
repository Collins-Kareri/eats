import 'package:flutter/material.dart';
import 'package:firstapp/ui/image.dart';

class FoodsContent extends StatelessWidget {
  late final dynamic _foods;

  FoodsContent(foods, {super.key}) {
    _foods = foods;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _foods.docs.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: MyImage(_foods.docs[index]["coverImg"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(_foods.docs[index]["foodname"],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_foods.docs[index]["price"],
                                style: TextStyle(color: Colors.grey[700])),
                            OutlinedButton(
                                onPressed: (() {}),
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(color: Colors.grey[700]),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
