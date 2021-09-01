import 'package:flutter/material.dart';
import '../services/firestore.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome_screen';

  void test() {
    FireStoreDatabase().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(child: Text('vnsbv'), onPressed: test),
      ),
    );
  }
}
