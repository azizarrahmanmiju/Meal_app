
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget{
   const DrawerScreen ({super.key,
   required this.onselectscreen
   });

   final void Function(String identifier) onselectscreen;

   
   @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
              Theme.of(context).colorScheme.primaryContainer
              ]
              ),
            ),
            curve: Curves.bounceInOut,
            child: Row(
                children: [
                  Icon(Icons.account_circle_rounded,size: 70,),
                  SizedBox(width: 12,),
                  Text("MAR miju",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  ),
                ],
                 )
          ),
          
          ListTile(
             onTap:(){
              onselectscreen("filter");
            } ,
            leading: Icon(Icons.settings,size: 25, color: Theme.of(context).colorScheme.tertiary,),
            title: Text("Filter"),
          )
        ],
      ),
    );
  }
}