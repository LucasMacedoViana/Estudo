import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_creens.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
          )
        )
      ),
      routes: {
        AppRoutes.HOME : (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS : (ctx) => CategoriesMealsScreens(),
      },
    );
  }
}
