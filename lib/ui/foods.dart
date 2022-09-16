import 'package:flutter/material.dart';

class Foods extends StatelessWidget {

  late final String _foodCategory;

  Foods(String foodCategory, {super.key}){
    _foodCategory = foodCategory;
  }
  final List<Map<dynamic,dynamic>> foods = [
    {
      "price":"ksh. 200",
      "foodname":"Chicken nuggets 6pcs",
      "coverImg":"",
    },
    {
      "price":"ksh. 400",
      "foodname":"Chicken nuggets 12pcs",
      "coverImg":"",
    },
    {
      "price":"ksh. 300",
      "foodname":"foodname",
      "coverImg":"",
    }
  ];

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.grey[600],
    backgroundColor: Colors.grey[200],
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
              itemCount: foods.length,
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
                          color:Colors.grey[200],
                          borderRadius: const BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  foods[index]["foodname"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  foods[index]["price"],
                                  style: TextStyle(
                                      color: Colors.grey[700]
                                  )
                                ),
                                OutlinedButton(
                                    onPressed: 
                                    (() {}), 
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                        color: Colors.grey[700]
                                      ),
                                    )
                                  )
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