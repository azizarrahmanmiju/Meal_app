
import 'package:flutter/material.dart';
import 'package:meal_app/Model/cetagori_blueprint.dart';


class GridviewitemBp extends StatelessWidget {

  const GridviewitemBp({   
    super.key,
    required this.cetagoty,
    required this.setectedonclick
  });

    final Category cetagoty;   
    final void Function() setectedonclick;


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: setectedonclick,
      splashColor: const Color.fromARGB(255, 150, 149, 149),
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration:  BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius:const BorderRadius.all(Radius.circular(8))
          ),
          child: Expanded(
            child:Text(
              cetagoty.title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.background,
                fontSize: width / 25
              ),
              ),
            ) 
          ),
        ),
      );
    
  }
}