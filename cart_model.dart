import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Pizza", "5.8", "assets/pizza.png", Colors.red],
    ["Burger", "3.0", "assets/burger.png", Colors.yellow],
    ["Shawarma", "2.9", "assets/shawarma.png", Colors.blue],
    ["Biryani", "4.6", "assets/biryani.png", Colors.green],
    ["Fries", "1.0", "assets/fries.png", Colors.brown],
    ["Juice", "1.7", "assets/juice.png", Colors.orange]
  ];

  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
