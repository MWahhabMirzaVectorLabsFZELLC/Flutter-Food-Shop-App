import 'package:flutter/material.dart';
import 'package:food_shop_app/cart_model.dart';
import 'package:food_shop_app/shop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'Food Shop',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              "Food Shop",
              style: GoogleFonts.permanentMarker(
                color: Colors.black,
                fontSize: 70,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30, right: 80, left: 80),
            child: Image.asset(
              "assets/shop.png",
            ),
          ),
          Padding(
              padding: EdgeInsets.all(0),
            child: Text(
              "Free Home Delivery!",
              textAlign: TextAlign.center,
              style: GoogleFonts.kaushanScript(
                  fontSize: 60,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "|A taste you'll remember|",
            style: GoogleFonts.merienda(
                fontSize: 30,
                color: Colors.white
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100)
              ),
              child: MaterialButton(
                padding: EdgeInsets.all(20),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Shop();
                        },
                    )
                ),
                child: Text(
                  "Start Shopping",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
