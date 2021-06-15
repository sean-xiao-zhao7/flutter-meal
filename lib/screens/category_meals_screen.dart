import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> _allMeals;

  CategoryMealsScreen(this._allMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> meals;
  var _loaded = false;

  @override
  void didChangeDependencies() {
    if (!_loaded) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      // find meal
      meals = widget._allMeals.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();
      _loaded = true;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void removeMealItem(String id) {
    setState(() {
      meals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            duration: meals[index].duration,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
