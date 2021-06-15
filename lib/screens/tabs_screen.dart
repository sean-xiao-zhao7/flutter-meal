import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorites_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> _favMeals;

  TabsScreen(this._favMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens;
  int _currentScreen = 0;

  @override
  void initState() {
    _screens = [
      {
        'page': CategoriesScreen(),
        'title': Text('Categories'),
      },
      {
        'page': FavoritesScreen(widget._favMeals),
        'title': Text('Favorites'),
      }
    ];
    super.initState();
  }

  void _changeScreen(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_currentScreen]['title'],
      ),
      drawer: MainDrawer(),
      body: _screens[_currentScreen]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _currentScreen,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
