import 'package:flutter/material.dart';

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
