import 'package:flutter/material.dart';
import 'package:meal/data/meals.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFav;
  final Function _isFav;

  MealDetailsScreen(this.toggleFav, this._isFav);

  Widget buildHeader(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(ctx).textTheme.title),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${meal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
              height: 300,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: buildHeader(context, 'Ingredients'),
            ),
            buildContainer(ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    meal.ingredients[index],
                  ),
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: buildHeader(context, 'Steps'),
            ),
            buildContainer(ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isFav(meal.id) ? Icon(Icons.delete) : Icon(Icons.star),
        onPressed: () {
          toggleFav(meal.id);
        },
      ),
    );
  }
}
