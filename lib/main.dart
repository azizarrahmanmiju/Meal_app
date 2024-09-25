
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/Screen/bottom_navigation.dart';


  final theme = ThemeData(
  useMaterial3: true,
  
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color.fromARGB(255, 0, 225, 255)),
      textTheme: GoogleFonts.poppinsTextTheme(),

  );

void main(){
  runApp(ProviderScope(child: Myapp()));
}


class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context){ 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: NavigationScreen()
    );
  }
}