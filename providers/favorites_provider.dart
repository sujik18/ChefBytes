import 'package:chef_bytes/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chef_bytes/providers/meals_provider.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  //final Reader _read;

  FavoritesNotifier()
      : super([]); //Intialiser list of meals which will be stored in notifier

  bool toggleMealFavorite(Meal meal) {
    /* if (state.contains(mealId)) {
      state = state..remove(mealId);     //state holds the list of meals
    } else { 
      state = state..add(mealId); 
    }*/
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); //where produces a new list
          return false;
    } else {
      state = [
        ...state,
        meal
      ]; //... add each single element from state into new list and then also add meal into it
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) { // adding to get better type support
  return FavoritesNotifier();
});
