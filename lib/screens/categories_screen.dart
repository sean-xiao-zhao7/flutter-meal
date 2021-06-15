import 'package:flutter/material.dart';
import 'package:meal/widgets/category_item.dart';
import '../data/categories.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Fried Krispy'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: CATEGORIES.map((categoryData) {
          return CategoryItem(
              categoryData.id, categoryData.title, categoryData.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
