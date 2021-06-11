import 'package:flutter/material.dart';
import 'package:meal/screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Fried Krispy',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.green.shade300,
        canvasColor: Colors.white,
        fontFamily: 'FiraSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Colors.black87),
              body2: TextStyle(color: Colors.black54),
              title: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}
