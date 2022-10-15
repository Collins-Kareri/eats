import 'package:flutter/material.dart';
import 'package:firstapp/screens/home/foods/ui_elements/image.dart';
import 'package:firstapp/screens/home/foods/ui_elements/card_bottom.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/food_image_provider.dart';

class FoodsContent extends StatefulWidget {
  late final dynamic _foods;

  FoodsContent(foods, {super.key}) {
    _foods = foods;
  }

  @override
  State<FoodsContent> createState() => _FoodsContentState();
}

class _FoodsContentState extends State<FoodsContent> {
  @override
  Widget build(BuildContext context) {
    final foodImageProvider = context.read<FoodImages>();

    return Expanded(
      child: ListView.builder(
        itemCount: widget._foods.docs.length,
        itemBuilder: ((context, index) {
          final foodname = widget._foods.docs[index]['foodname'];
          final coverImg = widget._foods.docs[index]['coverImg'];
          final price = widget._foods.docs[index]['price'];

          foodImageProvider
              .addImage({'foodname': foodname, 'coverImg': coverImg});

          return Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    child: MyImage(coverImg),
                  ),
                  CardBottom(price, foodname)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
