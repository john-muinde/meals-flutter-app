import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile({
    required String title,
    required VoidCallback handlerFunction,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 36,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: handlerFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            title: 'Meals',
            handlerFunction: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icons.restaurant,
          ),
          buildListTile(
            title: 'Filters',
            handlerFunction: () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            },
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
