import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AppColors.dart';

class AppTheme {
  Color primary = AppColors.primaryColorMaterial;

  ThemeData theme()=> ThemeData(
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.neutralColorV7,
    brightness: Brightness.light,
    cardColor: AppColors.neutralColorV7,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 2,
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
    ),
    primaryColorDark: Colors.black,
    bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.primaryColor
    ),
  );

  BoxDecoration containerDecoration()=> BoxDecoration(
      color:AppColors.neutralColorV6,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0)
      )
  );
}