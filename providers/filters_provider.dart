import 'package:chef_bytes/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super(
          {
            Filter.glutenFree: false,
            Filter.lactoseFree: false,
            Filter.vegetarian: false,
            Filter.vegan: false,
          },
        );
  void setFilters(Map<Filter, bool> chosenfilters) {
    state = chosenfilters;
  }
  void setFilter(Filter filter, bool value) {
    state = {
      ...state, // old key value pairs
      filter: value, // one new value pair addded
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

//Multiple provider

final filteredMealsProvider = Provider((ref) {
   final meals = ref.watch(mealsProvider);
   final activeFilters = ref.watch(filtersProvider);
   return  meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      } 
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

});