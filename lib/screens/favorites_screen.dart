import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> _favMeals;

  FavoritesScreen(this._favMeals);

  @override
  Widget build(BuildContext context) {
    if (_favMeals.isEmpty) {
      return Center(
        child: Text('No favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favMeals[index].id,
            title: _favMeals[index].title,
            imageUrl: _favMeals[index].imageUrl,
            duration: _favMeals[index].duration,
            complexity: _favMeals[index].complexity,
            affordability: _favMeals[index].affordability,
          );
        },
        itemCount: _favMeals.length,
      );
    }
  }
}
