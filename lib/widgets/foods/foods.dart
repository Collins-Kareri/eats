import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/widgets/foods/ui_elements/card.dart';

class Foods extends StatelessWidget {
  late final String _foodCategory;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final dynamic foods;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );

  Foods(String foodCategory, {super.key}) {
    _foodCategory = foodCategory;
    getFood();
  }

  getFood() async {
    try {
      final firestoreRes = await _db
          .collection("foods")
          .where("type", isEqualTo: _foodCategory)
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
