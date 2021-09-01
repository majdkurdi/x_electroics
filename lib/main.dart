import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './views/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
