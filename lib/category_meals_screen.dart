import 'package:flutter/material.dart';
import './data.dart';
import './meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/Category-Meals';

  // const MyWidget({Key? key}) : super(key: key);
  // String title;
  // String id;
  // CategoryMealsScreen(this.title, this.id);
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String categoryTitle = routArgs['title'].toString();
    final id = routArgs['id'];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id.toString(),
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
