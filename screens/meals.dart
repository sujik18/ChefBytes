import 'package:chef_bytes/screens/meal_details.dart';
import 'package:chef_bytes/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:chef_bytes/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    //required this.onToggleFavoriteFunctionFrwd,
  });
  final String? title;  //can be null
  final List<Meal> meals; // list of meal of type meal which is a model class
  //final void Function(Meal meal) onToggleFavoriteFunctionFrwd;

  void selectMeal(BuildContext ctx, Meal meal) {
    
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal,
          //onToggleFavorite: onToggleFavoriteFunctionFrwd,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) {
          selectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'No meals found for the selected category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
    if(title == null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
