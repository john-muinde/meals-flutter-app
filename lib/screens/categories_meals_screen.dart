import 'package:flutter/material.dart';
import 'meal_item.dart';
import '../models/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // const CategoriesMealsScreen({
  //   super.key,
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });

  static const routeName = 'category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id']!;

    final categoryItems = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: categoryItems[index].title,
            imageUrl: categoryItems[index].imageUrl,
            duration: categoryItems[index].duration,
            complexity: categoryItems[index].complexity,
            affordability: categoryItems[index].affordability,
          );
        },
        itemCount: categoryItems.length,
      ),
    );
  }
}
