import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Model/meal_blue.dart';


class FavoritemealsNotifier extends StateNotifier <List<Meal>> {
    FavoritemealsNotifier() : super([]);

    bool favoriteMealTogle (Meal meal){
   final mealsisfavorite = state.contains(meal);


   if(mealsisfavorite){
     state = state.where((m)=>m.id != meal.id).toList();
    return false;
   }else{
    state = [...state , meal];
    return true;
   }

    }    
}

final favoriteMealsNotifierProvider = StateNotifierProvider< FavoritemealsNotifier, List<Meal>>((ref){
  return FavoritemealsNotifier();
});