import 'package:flutter/material.dart';
import 'package:firstapp/widgets/foods/ui_elements/image.dart';
import 'package:firstapp/widgets/foods/ui_elements/card_bottom.dart';

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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: MyImage(_foods.docs[index]["coverImg"]),
                  ),
                  CardBottom(_foods.docs[index]["price"],
                      _foods.docs[index]["foodname"])
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
