import 'package:flutter/material.dart';
import './data.dart';
import './category_item.dart';

class Categories extends StatelessWidget {
  //const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.title, catData.color, catData.id))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 30,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ));
  }
}
