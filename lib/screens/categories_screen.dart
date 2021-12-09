import 'package:flutter/material.dart';
import 'package:meals_app/builders/category_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
        ),
        child: const Text(
          'Filters',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: LayoutBuilder(
        builder: (context, constraints) {
          var screen = constraints.maxHeight;
          return Column(
            children: [
              Container(
                color: Colors.white,
                height: screen * 0.4,
              ),
              SizedBox(
                height: screen * 0.6,
                child: const CategoryList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
