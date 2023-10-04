import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/screens/mainDrawer.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);
  static const routName = 'filters';

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutanFree = false;
  bool _vegiterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  Widget _buildSwitchTiles(
    bool currentValue,
    String title,
    String descreption,
  ) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(descreption),
        onChanged: (newValue) {
          setState(() {
            _glutanFree = newValue;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adgest your meal selection'),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTiles(
                    _glutanFree, 'glutan-free', 'only include glutan-free'),
                _buildSwitchTiles(
                    _glutanFree, 'vegiterian', 'only include vegiterian free'),
                _buildSwitchTiles(_glutanFree, 'vegan', 'only vegan free'),
                _buildSwitchTiles(_glutanFree, 'Lactose', 'only include free')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
