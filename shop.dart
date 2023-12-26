import 'package:flutter/material.dart';
import 'package:food_shop_app/food_item_tile.dart';
import 'package:food_shop_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_page.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade500,
        title: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Home();
                    },
                )
            ),
            icon: Icon(
              Icons.arrow_back
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartPage();
                  },
              )
          ),
        backgroundColor: Colors.grey.shade800,
        child: Icon(
          Icons.shopping_cart,
          size: 36,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 110),
            child: Text(
                "Welcome",
              style: GoogleFonts.carterOne(fontSize: 40),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Pick your favorites",
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Fresh food items",
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
          Expanded(
              child: Consumer<CartModel>(
                builder: (
                    context,
                    value,
                    child
                    ) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        childAspectRatio: 1/1
                      ),
                      itemBuilder: (context, index) {
                        return FoodItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imageUrl: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index);
                          },
                        );
                      }
                  );
                },

              )
          )
        ],
      ),
    );
  }
}
