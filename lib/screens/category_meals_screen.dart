import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/models.dart';

import 'meal_details_screen.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? meals;

  List<Meal> availableMeals = DUMMY_MEALS;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final mealId = routeArgs['id'];
    meals = availableMeals.where((meal) {
      return meal.categories.contains(mealId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: ListView.builder(
        itemCount: meals!.length,
        itemBuilder: (ctx, index) {
          var complexity = meals![index].complexity;
          var affordability = meals![index].affordability;

          return Card(
            child: ListTile(
              leading: Hero(
                tag: 'mealImage',
                child: Image.network(meals![index].imageUrl, width: 70),
              ),
              title: Text('${meals![index].title}'),
              subtitle: Text('${meals![index].duration} Minutes  ' +
                  complexityText(complexity) +
                  '  ' +
                  affordabilityText(affordability)),
              onTap: () {
                Navigator.of(ctx).pushNamed(
                  MealDetailScreen.routeName,
                  arguments: meals![index].id,
                );
              },
            ),
          );
        },
      ),
    );
  }

  String complexityText(var checkComplexity) {
    switch (checkComplexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String affordabilityText(var checkAffordability) {
    switch (checkAffordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }
}
