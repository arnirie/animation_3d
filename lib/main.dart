import 'package:flutter/material.dart';
import 'screens/category_list.dart';

void main() {
  runApp(PinoyRecipeApp());
}

//TODO:
//DONE 1) Category Listing Screen
//DONE 2) Category
//DONE 3) Recipe Listing Screen
//DONE 4) Recipe
// 5) Recipe Viewing Screen

//TOPICS:
//GridView, Navigator, GestureDecture

class PinoyRecipeApp extends StatelessWidget {
  const PinoyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryListScreen(),
    );
  }
}
