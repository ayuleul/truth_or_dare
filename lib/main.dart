import 'package:flutter/material.dart';
import 'package:truth_or_dare/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
