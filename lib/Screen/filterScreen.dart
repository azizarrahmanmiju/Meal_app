
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';




class Filterscreen extends ConsumerWidget {
  const Filterscreen({super.key});

  
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final activefilter = ref.watch(filterstateprovider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Your Filter",style:Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        )),
      ),
         body: Column(
              children: [
                SwitchListTile(value:activefilter[Filter.glutenFree]! , onChanged: (isChecked){
                  ref.read(filterstateprovider.notifier)
                     .setFilter(Filter.glutenFree, isChecked);
                     
                 },
                title: Text("GlutenFree",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground ,
                  fontWeight:FontWeight.bold
                ) ),
                subtitle: Text("this is fluyent free meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  ),),
                ),
              
             
                SwitchListTile(value:activefilter[Filter.lactosefree]! , onChanged: (isChecked){
                  ref.read(filterstateprovider.notifier)
                     .setFilter(Filter.lactosefree, isChecked);
                     
                 },
                title: Text("vegan",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground ,
                  fontWeight:FontWeight.bold
                ) ),
                subtitle: Text("Include only vegan meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  ),),
                ),
             
                SwitchListTile(value:activefilter[Filter.vegeterian]! , onChanged: (isChecked){
                  ref.read(filterstateprovider.notifier)
                     .setFilter(Filter.vegeterian, isChecked);
                     
                 },
                title: Text("vegeterian",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground ,
                  fontWeight:FontWeight.bold
                ) ),
                subtitle: Text("Include only vegeterian meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  ),),
                ),
             
                
               SwitchListTile(value:activefilter[Filter.vegan]! , onChanged: (isChecked){
                  ref.read(filterstateprovider.notifier)
                     .setFilter(Filter.vegan, isChecked);
                     
                 },
                title: Text("Lactose",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground ,
                  fontWeight:FontWeight.bold
                ) ),
                subtitle: Text("Include only lactose meals",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  ),),
                ),
             
               
             
             
             
                 
              ],   
           ),
    );
  }
}