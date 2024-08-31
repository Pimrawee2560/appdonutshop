import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/productscreendonut.dart';
import 'package:flutter_application_1/pages/productscreen.dart';
import 'package:flutter_application_1/pages/auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DonutSwipe',
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreenDonut(),
                      ),
                    );
                  },
                  child: Text("Donut"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF3E3232),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListScreen(),
                      ),
                    );
                  },
                  child: Text("Drink"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF3E3232),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionalTranslation(
                  translation: Offset(0.1, 0.8),
                  child: Text(
                    "Promotions",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Transform.translate(
                  offset: Offset(0, -40),
                  child: Image.asset(
                    'assets/images/Buy-6-Free-6.png',
                    height: 300,
                    width: 370,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Transform.translate(
                  offset: Offset(0, -170),
                  child: Image.asset(
                    'assets/images/Buy-6-Free-6-(1).png',
                    height: 300,
                    width: 370,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Transform.translate(
                  offset: Offset(0, -305),
                  child: Image.asset(
                    'assets/images/Buy-6-Free-6-(2).png',
                    height: 300,
                    width: 370,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
