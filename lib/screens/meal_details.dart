import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../data.dart';

class MealDetails extends StatelessWidget {
  //const MealDetails({Key? key}) : super(key: key);
  static const routName = '/meal-details';
  Widget builgTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        'Ingredients',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black)),
      width: 300,
      height: 150,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedItem =
        DUMMY_MEALS.firstWhere((mealItem) => mealItem.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedItem.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image(
                image: NetworkImage(selectedItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            builgTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.amber,
                  child: Text(selectedItem.ingredients[index]),
                ),
                itemCount: selectedItem.ingredients.length,
              ),
            ),
            builgTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedItem.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedItem.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
