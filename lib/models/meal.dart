enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isVegan;
  final bool isLactoseFree;

  const Meal({
    required this.isGlutenFree,
    required this.isVegetarian,
    required this.isVegan,
    required this.isLactoseFree,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.affordability,
  });
}
