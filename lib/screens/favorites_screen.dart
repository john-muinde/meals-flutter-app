import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
          child: Text(
            'You have no favorites yet - start adding some!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
