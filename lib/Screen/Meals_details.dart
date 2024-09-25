import 'package:flutter/material.dart';
import 'package:meal_app/Model/meal_blue.dart';
import 'package:meal_app/widget/food_details.dart';

class MealsDetailsScreen extends StatelessWidget{
  const MealsDetailsScreen(
    {super.key, 
    required this.meals,
   
    });

  final Meal meals;




  @override
  Widget build(BuildContext context) {
    return FoodDetails(
      meals: meals,
     
      );
  }
}