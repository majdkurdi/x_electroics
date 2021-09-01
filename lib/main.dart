import 'package:flutter/material.dart';

import './views/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'TitilliumWeb',
        textTheme: TextTheme(
          headline6: TextStyle(fontFamily: 'TitilliumWeb'),
        ),
      ),
      routes: {
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
