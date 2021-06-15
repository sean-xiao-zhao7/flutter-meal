import 'package:flutter/material.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/category_meals_screen.dart';
import 'package:meal/screens/meal_details_screen.dart';

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
      routes: {
        '/': (context) => CategoriesScreen(),
        '/category-meals': (context) => CategoryMealsScreen(),
        '/meal-details': (context) => MealDetailsScreen()
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
