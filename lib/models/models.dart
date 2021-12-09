import 'package:flutter/material.dart';

class Category {
  final String? id;
  final String? title;
  final Color? color;

  const Category({
    this.id,
    this.title,
    this.color,
  });
}

enum Affordability {
  // ignore: constant_identifier_names
  Affordable,
  // ignore: constant_identifier_names
  Pricey,
  // ignore: constant_identifier_names
  Luxurious,
}

enum Complexity {
  // ignore: constant_identifier_names
  Simple,
  // ignore: constant_identifier_names
  Challenging,
  // ignore: constant_identifier_names
  Hard,
}

class Meal {
  final String? id;
  final List<String?> categories;
  final String? title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String?> ingredients;
  final List<String?> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });
}