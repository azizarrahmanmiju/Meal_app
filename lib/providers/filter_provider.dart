

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

enum Filter{
  glutenFree,
  lactosefree,
  vegeterian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>>{
  FilterNotifier() : super({
  Filter.glutenFree :false,
  Filter.lactosefree :false,
  Filter.vegeterian :false,
  Filter.vegan :false,
  });

  void setFilter (Filter filter, bool isactive){
    state = {
      ...state,
      filter : isactive
    };
  }

  void setfilters (Map<Filter , bool> choosenfilter){
    state = choosenfilter;
  }
}



final filterstateprovider = StateNotifierProvider<FilterNotifier, Map<Filter, bool> >((Ref)=> FilterNotifier());

final filtermealsprovider = Provider((ref){

 final activefilter = ref.watch(filterstateprovider);
 final meals = ref.watch(meals_provider);

  return meals.where((meal){
      if(activefilter[Filter.glutenFree]! && meal.isGlutenFree){
        return false;
      }
      if(activefilter[Filter.lactosefree]!  && meal.isLactoseFree){
        return false;
      }
      if(activefilter[Filter.vegeterian]! && meal.isVegetarian){
        return false;
      }
      if(activefilter[Filter.vegan]! && meal.isVegan){
        return false;
      }

      return true ;
      
       
  

    }).toList();
}

  
);