//import 'package:chef_bytes/models/meal.dart';
import 'package:chef_bytes/screens/categories.dart';
import 'package:chef_bytes/screens/meals.dart';
import 'package:chef_bytes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
//import 'package:chef_bytes/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chef_bytes/screens/filter_screen.dart';
import 'package:chef_bytes/providers/favorites_provider.dart';
import 'package:chef_bytes/providers/filters_provider.dart';

// const _kIntialFilters = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedpageindex = 0;
  //final List<Meal> _favoriteMeals = [];

  // void _showFavorites(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //     });
  //     _showFavorites('Removed from favorites');
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //     });
  //     _showFavorites('Added to favorites');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    switch (identifier) {
      case 'meals':
        _selectedpageindex = 0;
        //Navigator.of(context).pop();
        break;
      case 'filter':
        _selectedpageindex = 0;
        //final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
            builder: (ctx) => FiltersScreen(
                onSaveFilters: (filters) {}, 
            ),
          );
        break;

      default:
        _selectedpageindex = 0;
      //Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
   
    Widget activePage = CategoriesScreen(
      //onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedpageindex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
        //onToggleFavoriteFunctionFrwd: _toggleMealFavoriteStatus,
      ); // passing funct to meals screen then to meal details
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedpageindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
