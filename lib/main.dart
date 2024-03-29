import 'package:fetch_image/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        backgroundColor: Color(0xff191826),
        appBar: AppBar(
          backgroundColor: Color(0xff191826),
          title: Text(
            "Cocktail Compass",
            style: TextStyle(
              fontSize: 23,
              color: Color(0xfff43370),
            ),
          ),
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Home(),
      ),
    );
  }
}
