import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import './categories.dart';
import './category_meals_screen.dart';
import './screens/meal_details.dart';
import './screens/filters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabsScreen(),
      //initialRoute: '/',
      routes: {
        //'/': (context) => Categories(),
        CategoryMealsScreen.routName: (context) => CategoryMealsScreen(),
        MealDetails.routName: (context) => MealDetails(),
        Filters.routName: (context) => Filters()
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      // },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      },
    );
  }
}
