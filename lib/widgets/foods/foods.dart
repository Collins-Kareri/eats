import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/widgets/foods/foods_content.dart';

class Foods extends StatelessWidget {
  late final String _foodCategory;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  dynamic foods;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.grey[600],
    backgroundColor: Colors.grey[200],
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

      print('data $firestoreRes.docs.asMap()');
      foods = firestoreRes;
      return firestoreRes;
    } catch (err) {
      print('err $err');
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
                children: [
                  const Icon(
                    Icons.error,
                    size: 28.0,
                  ),
                  Text(
                    "Error occured fetching",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return FoodsContent(foods);
        } else {
          return Expanded(
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.grey[900],
            )),
          );
        }
      },
    );
  }
}
