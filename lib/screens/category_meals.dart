import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/models.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMeals({Key? key}) : super(key: key);
  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
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
    meals = /* widget. */ availableMeals.where((meal) {
      return meal.categories.contains(mealId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemCount: meals!.length,
        itemBuilder: (ctx, index) {
          var complexity = meals![index].complexity;
          var affordability = meals![index].affordability;

          return Card(
            child: ListTile(
              onTap: () {},
              leading: Image.network(meals![index].imageUrl, width: 70),
              title: Text('${meals![index].title}'),
              subtitle: Text('${meals![index].duration} Minutes  ' +
                  complexityText(complexity) +
                  '  ' +
                  affordabilityText(affordability)),
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
