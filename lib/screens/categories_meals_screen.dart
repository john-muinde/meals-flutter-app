import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // const CategoriesMealsScreen({
  //   super.key,
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });

  static const routeName = 'category-meals';
  final List<Meal> availableMeals;
  CategoriesMealsScreen(this.availableMeals);

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id']!;

    final categoryItems = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryItems[index].id,
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
