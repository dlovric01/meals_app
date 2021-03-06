import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: DUMMY_CATEGORIES.length,
      itemBuilder: (ctx, index) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: DUMMY_CATEGORIES[index].color!.withOpacity(0.5),
            ),
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            height: 100,
            width: double.infinity,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: DUMMY_CATEGORIES[index].color,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.of(ctx).pushNamed(
                    CategoryMealsScreen.routeName,
                    arguments: {
                      'id': DUMMY_CATEGORIES[index].id,
                      'title': DUMMY_CATEGORIES[index].title
                    },
                  );
                },
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          DUMMY_CATEGORIES[index].title.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ClipPath(
                        clipper: MyCustomClipper(),
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.network(
                            DUMMY_MEALS[index].imageUrl,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 1.5, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
