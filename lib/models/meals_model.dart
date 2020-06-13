import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Expensive, Luxurious }

class Meal {
  final String mealID;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> procedures;
  final int preparationTime;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.mealID,
      @required this.title,
      @required this.imageUrl,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.complexity,
      @required this.affordability,
      @required this.preparationTime,
      @required this.categories,
      @required this.ingredients,
      @required this.procedures});
}
