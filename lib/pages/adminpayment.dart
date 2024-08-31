import 'package:flutter/material.dart';

class AdminPaymentScreen extends StatelessWidget {
  final String accountName;

  const AdminPaymentScreen({Key? key, required this.accountName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Payment'),
      ),
      body: Center(
        child: Text(
          'Account Name: $accountName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
