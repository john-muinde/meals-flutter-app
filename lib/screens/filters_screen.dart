import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false,
      _vegetarian = false,
      _vegan = false,
      _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile({type, subtitle, currentValue, updateValue}) {
    return SwitchListTile(
      title: Text(type),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(
        subtitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Filter'),
        actions: [
          IconButton(
            onPressed: () {
              final _filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(_filters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  currentValue: _glutenFree,
                  subtitle: 'Only Include gluten-free meals',
                  type: 'Gluten-free',
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  currentValue: _lactoseFree,
                  subtitle: 'Only Include lactose-free meals',
                  type: 'Lactose-free',
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  currentValue: _vegan,
                  subtitle: 'Only Include vegan meals',
                  type: 'Vegan-free',
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  currentValue: _vegetarian,
                  subtitle: 'Only Include Vegetarian meals',
                  type: 'Vegetarian-free',
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
