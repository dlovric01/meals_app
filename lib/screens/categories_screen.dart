import 'package:flutter/material.dart';
import 'package:meals_app/builders/category_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Meals'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColorDark),
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
          return Stack(
            children: [
              SizedBox(
                height: screen,
                width: double.infinity,
                child: Opacity(
                  opacity: 0.03,
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/a/aa/Europe_map.png',
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.purple, width: 2),
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  height: screen * 0.3,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Europe',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  height: screen * 0.7,
                  child: const CategoryList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
