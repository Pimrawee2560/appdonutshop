import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/button.dart';
import 'package:flutter_application_1/Components/colors.dart';
import 'package:flutter_application_1/JSON/users.dart';
import 'package:flutter_application_1/pages/loginscreen.dart';
import 'package:flutter_application_1/pages/homescreen.dart';

class ProfileScreen extends StatelessWidget {
  final Users? profile;
  const ProfileScreen({Key? key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3232),
        centerTitle: true,
        title: const Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.home),
        ),
      ),
      backgroundColor: Color(0xFFF9F07A),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 77,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/no_user.jpg"),
                    radius: 75,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  profile!.fullName ?? "",
                  style: const TextStyle(fontSize: 28, color: primaryColor),
                ),
                Text(
                  profile!.email ?? "",
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Button(
                  label: "LOG OUT",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person, size: 30),
                  subtitle: Text(profile!.fullName ?? ""),
                  title: const Text("Full Name"),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle, size: 30),
                  subtitle: Text(profile!.usrName),
                  title: const Text("Username"),
                ),
                ListTile(
                  leading: const Icon(Icons.email, size: 30),
                  subtitle: Text(profile!.email ?? ""),
                  title: const Text("Email"),
                ),
                ListTile(
                  leading: const Icon(Icons.home, size: 30),
                  subtitle: Text(profile!.address ?? ""),
                  title: const Text("Address"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
