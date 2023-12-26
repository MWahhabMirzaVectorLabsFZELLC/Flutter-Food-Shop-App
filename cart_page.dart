import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade500,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "My Cart",
                      style: GoogleFonts.lobster(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: value.cartItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: ListTile(
                                  leading: Image.asset(
                                    value.cartItems[index][2],
                                    height: 60,
                                  ),
                                  title: Text(
                                    value.cartItems[index][0],
                                    style: TextStyle(
                                        fontSize: 25
                                    ),
                                  ),
                                  subtitle: Text(
                                    "\$ "+ value.cartItems[index][1],
                                    style: TextStyle(
                                        fontSize: 25
                                    ),
                                  ),
                                  trailing: IconButton(
                                      icon: Icon(
                                        Icons.cancel,
                                        size: 40,
                                      ),
                                      onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                          .removeItemFromCart(index)
                                  ),
                                ),
                              ),
                            );
                          }
                      )
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25
                              ),),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "\$ "+ value.calculateTotal(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red,
                            border: Border.all(
                                color: Colors.red
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                  "Pay Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 25,
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
        )
    );
  }
}