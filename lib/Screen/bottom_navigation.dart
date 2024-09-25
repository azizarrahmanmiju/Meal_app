import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Screen/Categories.dart';
import 'package:meal_app/Screen/Meals.dart';
import 'package:meal_app/Screen/filterScreen.dart';
import 'package:meal_app/providers/favoritemealsproverder.dart';
import 'package:meal_app/providers/filter_provider.dart';
import 'package:meal_app/widget/side_drawer.dart';



const kinitilizedfilter ={
    
    Filter.glutenFree : false,
    Filter.lactosefree :false,
    Filter.vegeterian : false,
    Filter.vegan : false

  };

class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({super.key});
  @override
  ConsumerState<NavigationScreen> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<NavigationScreen> {
 
    void _setScreen (String identifier) async {
    if(identifier=="filter"){
      Navigator.pop(context);
        await Navigator.of(context).push<Map<Filter,bool>>(
          MaterialPageRoute(
           builder: (context)=> Filterscreen()

        ) );
        
       
    }
      
    }
    

  int indexnumber = 0;


  void _selectpage(int index) {
    setState(() {
      indexnumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final availablemeals = ref.watch(filtermealsprovider);

   
    String appbartitle = "Select Your Category";
    Widget Activepage = CategoryScreen(
      availablemeals: availablemeals,
      
    );

    if (indexnumber == 1) {
      appbartitle = "Your Favorites";
      final favoritemeals = ref.watch(favoriteMealsNotifierProvider);
      Activepage = MealsScreen(
        meals:favoritemeals ,
      );
    }


    return Scaffold(
      drawer: DrawerScreen(onselectscreen: _setScreen,),
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(appbartitle),
      ),
      body: Activepage,
      bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,

        onTap: _selectpage,
        currentIndex: indexnumber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
