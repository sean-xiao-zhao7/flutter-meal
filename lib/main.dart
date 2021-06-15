import 'package:flutter/material.dart';
import 'package:meal/data/meals.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/category_meals_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meal_details_screen.dart';
import 'package:meal/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'milk': false,
    'crunchy water': false,
    'red ring of death': false,
  };
  List<Meal> _allMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void setFilters(Map<String, bool> newFilter) {
    setState(() {
      _filters = newFilter;
      _allMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        } else if (_filters['milk'] && !element.isLactoseFree) {
          return false;
        } else if (_filters['crunchy water'] && !element.isVegetarian) {
          return false;
        } else if (_filters['red ring of death'] && !element.isVegan) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void toggleFav(String id) {
    final int favIndex = _favMeals.indexWhere((element) => element.id == id);
    if (favIndex >= 0) {
      setState(() {
        _favMeals.removeAt(favIndex);
      });
    } else {
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isFav(String id) {
    return _favMeals.any((element) => element.id == id);
  }

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
        '/': (context) => TabsScreen(_favMeals),
        '/category-meals': (context) => CategoryMealsScreen(_allMeals),
        '/meal-details': (context) => MealDetailsScreen(toggleFav, _isFav),
        '/filters': (context) => FiltersScreen(_filters, setFilters),
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
