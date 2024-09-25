

import 'package:flutter/material.dart';
import 'package:meal_app/Model/meal_blue.dart';
import 'package:meal_app/Screen/Meals_details.dart';
import 'package:meal_app/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
   const MealsScreen( {super.key, 
    required this.meals,
    this.title,
    });






  void _onclickedlitenerpro (BuildContext context , Meal meal){
  Navigator.push(
    context, MaterialPageRoute(
    builder: (cntxt)=> 
    MealsDetailsScreen(meals: meal )
    )
    );
   }

 final List<Meal> meals;
 final String? title ;
@override

  Widget build(BuildContext context) {

    final Displaywidth = MediaQuery.sizeOf(context);

    Widget content=  Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Center(
           
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
             children: [
              Text("Opps!...there have no data 😒",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize:Displaywidth.width/26
              ),        
              ),
               
             ],
            ),
      ),
    );

    if(meals.isNotEmpty){
         content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (cntx, index) =>MealItem(meal: meals[index],selectedlitsenert:(BuildContext context ,meal){
            _onclickedlitenerpro(context, meal);
          } ,)
         );
    }
    if(title ==null){
      return content ;
    }
    
    return Scaffold(
     backgroundColor: Theme.of(context).colorScheme.primaryContainer,
     appBar: AppBar(       
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      title: Text(title!),
     ),
      body:content
    );
  }
}