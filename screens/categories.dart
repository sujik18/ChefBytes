import 'package:chef_bytes/models/category.dart';
import 'package:chef_bytes/models/meal.dart';
import 'package:chef_bytes/screens/meals.dart';
import 'package:flutter/material.dart';
import 'package:chef_bytes/data/dummy_data.dart';
import 'package:chef_bytes/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  //final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _animationController; //late is used to tell dart that intiially doesnt has value but not when class is created
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this, //this entire class to get info from ticker
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward(); // starting the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext ctx, Category cat) {
    final filteredMeals = widget.availableMeals
        .where((e) => e.categories.contains(cat.id))
        .toList();

    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: cat.title,
          meals: filteredMeals,
          // onToggleFavoriteFunctionFrwd: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Animations
    return AnimatedBuilder(
        animation: _animationController,
        //the contents which doesnt animated but are included
        child: GridView(
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio: 3 / 2, // item height is 1.5 times the item width
            crossAxisSpacing: 15, // space between columns
            mainAxisSpacing: 15, // space between rows
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
        ),
        builder: (context, child) => SlideTransition(
          // things that needs to be animated
              position: Tween(
                  begin: const Offset(0.0, 0.3), // 0% x axis , 30% y axis
                  end: const Offset(0, 0),
              ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
              child: child, //the grid view
            ),
        // Padding(           //this method will be executed for each tick of seconds
        //   padding: EdgeInsets.only(
        //       top: 100 - _animationController.value*100,
        //   ),
        );
  }
}
