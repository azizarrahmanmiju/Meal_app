

import 'package:flutter/material.dart';
import 'package:meal_app/Model/meal_blue.dart';
import 'package:meal_app/Screen/Meals.dart';
import 'package:meal_app/data/Dummydata.dart';
import 'package:meal_app/widget/Gridviewitem_bp.dart';
import 'package:meal_app/Model/cetagori_blueprint.dart';

class CategoryScreen extends StatefulWidget{
  const CategoryScreen({super.key,
  required this.availablemeals
  });

    final List<Meal> availablemeals ;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin {
  
    
    late AnimationController _animationController ;

    @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      lowerBound: 0,
      upperBound: 1,
      );

      _animationController.forward();
  }

   
   @override
  void dispose() {
    _animationController.dispose();
        super.dispose();
  }

   
   @override
  Widget build(BuildContext context,){

    
//======
    void _onclicklitsener(BuildContext context,Category categor){
      final filteredmeal = widget.availablemeals.where((meal)=>meal.categories.contains(categor.id)).toList();
       Navigator.push(context, MaterialPageRoute(
        builder:(cntx) =>  MealsScreen(
          title: categor.title,
          meals: filteredmeal,
          ),
          
          ));
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Padding(
        padding: EdgeInsets.all(16),
        child:AnimatedBuilder(
          animation: _animationController, 
          child:  GridView( 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio:4/2
            ,crossAxisSpacing: 20,
            mainAxisSpacing: 20),
          children: [
            for( final getallcetagories in availableCategories)
             GridviewitemBp(cetagoty: getallcetagories,
              setectedonclick: ()=> _onclicklitsener(context,getallcetagories))
            ],),
        builder: (context, child)=> SlideTransition(
          position: Tween(
            begin: Offset(0, 1),
            end: Offset(0, 0)
          
          ).animate(
              CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut)
            
            ),child: child,
          ),
          
         )
         

          
      ),
    );
  }
}