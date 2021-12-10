import 'package:flutter/material.dart';
import 'package:meals_app/builders/category_list.dart';

class CategoriesScreen extends StatefulWidget {
  final Function? saveFilters;
  final Map<String, bool>? filters;

  const CategoriesScreen(this.filters, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters!['gluten']!;
    _lactoseFree = widget.filters!['lactose']!;
    _vegetarian = widget.filters!['vegetarian']!;
    _vegan = widget.filters!['vegan']!;
    super.initState();
  }

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
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (context) => DialogFilters(
                    _glutenFree, _vegan, _vegetarian, _lactoseFree));
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  padding: const EdgeInsets.only(bottom: 5),
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

class DialogFilters extends StatelessWidget {
  final bool _glutenFree;
  final bool _vegan;
  final bool _vegetarian;
  final bool _lactoseFree;

  const DialogFilters(
      this._glutenFree, this._vegan, this._vegetarian, this._lactoseFree,
      {Key? key})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: const Center(child: Text('Set Filters')),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterButton(_glutenFree, 'Gluten'),
          FilterButton(_vegan, 'Vegan'),
          FilterButton(_vegetarian, 'Vege'),
          FilterButton(_lactoseFree, 'Lactose'),
        ],
      ),
      actions: [
        Center(
          child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Submit')),
        )
      ],
    );
  }
}

class FilterButton extends StatefulWidget {
  bool filter;
  String textFilter;

  FilterButton(this.filter, this.textFilter, {Key? key}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        setState(() {
          widget.filter = !widget.filter;
        });
      },
      label: Text(widget.textFilter),
      icon: Icon(widget.filter ? Icons.circle : Icons.circle_outlined),
    );
  }
}
