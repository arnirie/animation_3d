import 'package:flutter/material.dart';

import '../components/category_tile.dart';
import '../data/back_data.dart';

class CategoryListScreen extends StatefulWidget {
  CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  var categoryList = CATEGORIES;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        // milliseconds: 1000,
        seconds: 4,
      ),
      lowerBound: 0,
      upperBound: 1,
    );
    //start
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: () {
                animationController.forward();
              },
              icon: Icon(Icons.play_arrow))
        ],
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          // return Padding(
          //   padding: EdgeInsets.only(top: 200 * animationController.value),
          //   //0 to 1
          //   child: child!,
          // );
          // return Opacity(
          //   opacity: animationController.value,
          //   child: child!,
          // );
          // return SlideTransition(
          //   position: animationController.drive(
          //     Tween(
          //       begin: Offset(0, -1),
          //       end: Offset(0, 0),
          //     ),
          //   ),
          //   child: child,
          // );
          // return SlideTransition(
          //   position: Tween(
          //     begin: Offset(0, -1),
          //     end: Offset(0, 0),
          //   ).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.elasticInOut,
          //     ),
          //   ),
          //   child: child,
          // );
          // return FadeTransition(
          //   opacity: Tween<double>(
          //     begin: 0,
          //     end: 1,
          //   ).animate(
          //     CurvedAnimation(
          //         parent: animationController, curve: Curves.easeIn),
          //   ),
          //   child: child,
          // );
          // return SizeTransition(
          //   sizeFactor: CurvedAnimation(
          //     parent: animationController,
          //     curve: Curves.elasticIn,
          //   ),
          //   axis: Axis.vertical,
          //   axisAlignment: 1,
          //   child: child,
          // );
          return ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.bounceIn,
            ),
            alignment: Alignment.topCenter,
            child: child,
          );
        },
        child: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: categoryList.map((element) {
            return CategoryTile(
              category: element,
            );
          }).toList(),
        ),
      ),
    );
  }
}
