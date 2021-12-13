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
          return InkWell(
            onTap: () {},
            child: Text(meals![index].title.toString()),
          );
        },
      ),
    );
  }
}
