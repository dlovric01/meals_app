import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(selectedMeal.imageUrl),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 100,
              width: 200,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Text('${selectedMeal.ingredients[index]}');
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${index + 1})  ' '${selectedMeal.steps[index]}'),
                        const Divider(),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
