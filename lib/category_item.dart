import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  //const MyWidget({Key? key}) : super(key: key);
  final String title;
  final Color color;
  final String id;
  CategoryItem(@required this.title, this.color, @required this.id);
  selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
        // MaterialPageRoute(builder: (ctx) {
        //   return CategoryMealsScreen(title, id);
        // }),
        CategoryMealsScreen.routName,
        arguments: {'id': id, 'title': title}).then((result) {
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
