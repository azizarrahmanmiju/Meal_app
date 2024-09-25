
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget{
   const ItemDetails({
    super.key,
      required this.icon,
     required this.label
     });


   final IconData icon;
   final String label ;
   
  @override
  Widget build(BuildContext context) {
   return Row(
    children: [
      Icon(icon,size:20, color: const Color.fromARGB(220, 196, 252, 252),),
      SizedBox(width: 6,),
      Text(
        label,
        style: TextStyle(
            color: const Color.fromARGB(220, 197, 239, 250)
           )
           )
    ],
    
   );
  }
}