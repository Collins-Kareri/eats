import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/screens/home/foods/food_card.dart';

class Foods extends StatefulWidget {
  late final String _foodCategory;

  Foods(String foodCategory, {super.key}) {
    _foodCategory = foodCategory;
  }

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  dynamic foods;

  getFood() async {
    try {
      final firestoreRes = await _db
          .collection("foods")
          .where("type", isEqualTo: widget._foodCategory)
          .get();
      foods = firestoreRes;
      return firestoreRes;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFood(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.error,
                    size: 28.0,
                  ),
                  Text(
                    "Error occured fetching",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return FoodsContent(foods);
        } else {
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
