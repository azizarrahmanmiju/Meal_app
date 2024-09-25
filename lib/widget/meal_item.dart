

import 'package:flutter/material.dart';
import 'package:meal_app/Model/meal_blue.dart';
import 'package:meal_app/widget/item_details.dart';
import 'package:transparent_image/transparent_image.dart';



class MealItem extends StatelessWidget {

   const MealItem({super.key,
     required this. meal, 
     required this.selectedlitsenert,
      
   });

  final Meal meal;
  final void Function(BuildContext conttext, Meal meal) selectedlitsenert;
  
   

  String get getcomplexcity{
    return meal.complexity.name;
  }
  
  String get getaffordability{
    return meal.affordability.name;
  }



  @override
  Widget build(BuildContext context) {


    return  
       Card(
        margin:const  EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        elevation: 5,
      
        child: InkWell(
          onTap:(){
            selectedlitsenert(context,meal);
          },
          child: Stack(
            children: [
               Hero(
                tag: meal.id,
                 child: FadeInImage(placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl ,),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height /3,
                  width: MediaQuery.of(context).size.width,
                  ),
               ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: const Color.fromARGB(146, 15, 15, 15),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8) ,             
                    child: Column(
                      children: [ Text(meal.title,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color:Colors.white
                      ),textAlign: TextAlign.center,maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,),
                      SizedBox(height: 10,),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ItemDetails(icon: Icons.timelapse, label: meal.duration.toString() + 'min'),
                          SizedBox(width: 10,),
                          ItemDetails(icon: Icons.compare, label:getcomplexcity),
                          SizedBox(width: 10,),
                          ItemDetails(icon: Icons.workspaces , label:getaffordability),
                         ],
      
                         ),
      
                      ]
                        
                    ),
                  )
                  )
                
                 
                
            ],
          ),
       
      ),
    );




  }////class==========
}


  

