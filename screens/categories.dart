import 'package:chef_bytes/models/category.dart';
import 'package:chef_bytes/models/meal.dart';
import 'package:chef_bytes/screens/meals.dart';
import 'package:flutter/material.dart';
import 'package:chef_bytes/data/dummy_data.dart';
import 'package:chef_bytes/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite; 

  void _selectCategory(BuildContext ctx, Category cat) {
    final filteredMeals = dummyMeals
        .where((e) => e.categories.contains(cat.id))
        .toList();

    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: cat.title,
          meals: filteredMeals,
          onToggleFavoriteFunctionFrwd: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          childAspectRatio: 3 / 2, // item height is 1.5 times the item width
          crossAxisSpacing: 10, // space between columns
          mainAxisSpacing: 10, // space between rows
        ),
        children: [
          //with map method
          //availableCategories.map((cat) => CategoryGridItem(category: cat)).toList(),

          for (final cat in availableCategories)
            CategoryGridItem(
              category: cat,
              onSelectCategory: () {
                _selectCategory(context, cat);
              },
            ),
        ],
      );
  }
}
