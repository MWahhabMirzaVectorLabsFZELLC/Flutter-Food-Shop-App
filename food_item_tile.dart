import 'package:flutter/material.dart';

class FoodItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imageUrl;
  final Color color;
  void Function()? onPressed;

  FoodItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imageUrl,
    required this.color,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(25),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25)
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imageUrl,
              height: 150
            ),
            Text(
              itemName,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
            MaterialButton(
              onPressed: onPressed,
              color: Colors.blueGrey.shade900,
              shape: CircleBorder(eccentricity: 1),
              child: Text(
                "\$ " +itemPrice,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
