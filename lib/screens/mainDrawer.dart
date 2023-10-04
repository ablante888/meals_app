import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buidListile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
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
          color: Colors.amber,
          child: Text(
            'Cooking up !',
            style: TextStyle(
                color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        buidListile('Meals', Icons.restaurant, () {
          Navigator.pushReplacementNamed(context, '/');
        }),
        buidListile('Filters', Icons.settings, () {
          Navigator.pushReplacementNamed(context, Filters.routName);
        }),
      ],
    ));
  }
}
