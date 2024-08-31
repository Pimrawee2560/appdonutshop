import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/button.dart';
import 'package:flutter_application_1/pages/loginscreen.dart';
import 'package:flutter_application_1/pages/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F07A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "DonutSwipe",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E3232),
                  ),
                ),
                const Text(
                  "The most delicious donuts in the world",
                  style: TextStyle(color: Color(0xFF3E3232)),
                ),
                Expanded(
                    child: Image.asset(
                  "assets/images/donut.png",
                  height: 300, // กำหนดความสูงของรูป
                  width: 300, // กำหนดความกว้างของรูป
                )),
                Button(
                    label: "LOGIN",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    }),
                Button(
                    label: "SIGN UP",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
