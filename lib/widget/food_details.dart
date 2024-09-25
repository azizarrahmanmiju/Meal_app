import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:meal_app/Model/meal_blue.dart';
import 'package:meal_app/providers/favoritemealsproverder.dart';

class FoodDetails extends ConsumerWidget{

  const FoodDetails({
    super.key,
    required this.meals,
    });

  
  final Meal meals ;
    String get _getcomplexcity {
    return meals.complexity.name;
    }

  String get _getaffordability{
    return meals.affordability.name;
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final favoritemeals = ref.watch(favoriteMealsNotifierProvider);

    final isfavorite = favoritemeals.contains(meals);

    final maxtime = (meals.duration * 1.2).toString();
    final mintimes = (meals.duration ).toString();


   final times = mintimes +" To "+ maxtime + " min";

      var displayhight = MediaQuery.sizeOf(context).height;
   var displaywidth = MediaQuery.sizeOf(context).width;
                        //protait mood================================
 Widget content = SingleChildScrollView(
   child: Hero(
    tag: meals.id,
     child: Card(   
            color: Theme.of(context).colorScheme.secondaryContainer,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          elevation: 5,
              child: Column(
                children: [
                Container(
              child: Image.network(
                meals.imageUrl,      
                width:double.infinity,
                height:displayhight/3.9,
                fit: BoxFit.cover,
                )
                   ),
                   SizedBox(height: 20,),
                   Positioned(
                    left: 0,
                    right: 0,
                    bottom:0,
                     
                       child: Container(
                        alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),  
                            )                   
                          ), 
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: displaywidth / 15,
                              bottom: displayhight / 20
                            ),
                            
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name : "+meals.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color:Theme.of(context).colorScheme.primary ,
                                    fontWeight: FontWeight.bold,
                                    fontSize: displaywidth/22
                                  ),),
                                  SizedBox(height: 10,),
                                  Text("Complexity : "+ _getcomplexcity,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color:Theme.of(context).colorScheme.primary ,
                                        fontSize: displaywidth/27,
                                        fontWeight: FontWeight.normal,
                                      ),),
                                         
                                      //==========
                                      SizedBox(height: 10,),
                                      Text("Affordability : "+ _getaffordability,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color:Theme.of(context).colorScheme.primary ,
                                        fontSize: displaywidth/27,
                                        fontWeight: FontWeight.normal,
                                      ),),
                                  //============
                                  SizedBox(height: 10,),
                                  Text("duration : " + times ,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color:Theme.of(context).colorScheme.primary ,
                                    fontSize: displaywidth/27,
                                    fontWeight: FontWeight.normal,
                                  ),),
                                  SizedBox(height: 8,),
                                  ///==========
                                   Text("Ingredients ",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color:Theme.of(context).colorScheme.primary ,
                                    fontSize: displaywidth/27,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                  SizedBox(height: 5,),
                              
                                for (int i = 0; i < meals.ingredients.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                         left: 10,
                                        right: 10,
                                        bottom: 5,
                                      ),
                                      child: Text("${i+1}. ${meals.ingredients[i]}",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontSize: displaywidth/29
                                      ),
                                      ),
                                    ),
                               
                                SizedBox(height: 8,),
                                  ///==========
                                   Text("Step ",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color:Theme.of(context).colorScheme.primary ,
                                    fontSize:displaywidth/30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                  SizedBox(height: 5,),
                              
                                 for (int i = 0; i < meals.steps.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 5,
     
                                      ),
                                      child: Text("${i+1}. ${meals.steps[i]}",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontSize: displaywidth/29
                                      ),
                                      ),
                                    ),
                                /////////////=-=========================================for Step
                                ],
                              ),               
                          ),  
                        ),
                     ),
                ],
              ),
          ),
   ),
 );
     
     
   
   return Scaffold(         //view content Start
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.primaryContainer ,
        title: Text(meals.title, style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: (){
               final mealaded = ref
               .read(favoriteMealsNotifierProvider.notifier)
               .favoriteMealTogle(meals);
                ScaffoldMessenger.of(context).clearSnackBars();
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               content: Row(
              children: [
              Center(child: Text(mealaded ? "meal added as a favorite" : "meal remove from favorite", textAlign: TextAlign.center)),
                ],
              ),
                 ));
              },
              icon:AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(
                      begin: 0.8,
                      end: 1.0
                    ).animate(animation),
                    child: child,
                  );
                  

                },
                child: Icon(
                  isfavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isfavorite),
                  ),
              ) ,
          ),
          )
        ],
      ),
      body: content
      
      
      );
    
      
    
  }
  
  



}