import 'package:flutter/material.dart';

class AppColors {
  //primaryColors
  static const Color primaryColor = Color(0xFF00EA35);
  static const Color primaryColorStrong = Color(0xFF15B52C);
  static const Color primaryColorV1 = Color(0xFF8DFEA1);
  static const primaryColorInt = 0xFFFF009E;

  //neutralColors
  static const Color neutralColor = Color(0xFF464646);
  static const Color neutralColorV1 = Color(0xFF666666);
  static const Color neutralColorV2 = Color(0xFFA3A3A3);
  static const Color neutralColorV3 = Color(0xFFC2C2C2);
  static const Color neutralColorV4 = Color(0xFFE4E4E4);
  static const Color neutralColorV5 = Color(0xFFF1F1F1);
  static const Color neutralColorV6 = Color(0xFFF6F6F6);
  static const Color neutralColorV7 = Color(0xFFFFFFFF);

  //semanticGreenColor
  static const Color greenColor = Color(0xFF00EA35);
  static const Color greenColorV1 = Color(0xFFC9FFCD);
  static const Color greenColorV2 = Color(0xFFEAFFEB);
  static const Color greenColorV3 = Color(0xFF009811);

  //semanticRedColor
  static const Color redColor = Color(0xFFFF001E);
  static const Color redColorV1 = Color(0xFFFFE9ED);
  static const Color redColorV2 = Color(0xFFFFC8CE);
  static const Color redColorV3 = Color(0xFFD20011);
  static const Color redColorV4 = Color(0xFFFFE9ED);

  //semanticOrangeColor
  static const Color orangeColor = Color(0xFFFFA900);
  static const Color orangeColorV1 = Color(0xFFFFE9B0);
  static const Color orangeColorV2 = Color(0xFFFFF7E0);

  //semanticBlueColor
  static const Color blueColor = Color(0xFF159CFF);
  static const Color blueColorV1 = Color(0xFFBCE1FF);
  static const Color blueColorV2 = Color(0xFFE3F3FF);

  //semanticBlack
  static const Color blackColor = Color(0xFF000000);

  static MaterialColor primaryColorMaterial = MaterialColor(
    primaryColorInt,
    <int, Color>{
      50: Color.fromRGBO(0, 234, 53, .1),
      100: Color.fromRGBO(0, 234, 53, .2),
      200: Color.fromRGBO(0, 234, 53, .3),
      300: Color.fromRGBO(0, 234, 53, .4),
      400: Color.fromRGBO(0, 234, 53, .5),
      500: Color.fromRGBO(0, 234, 53, .6),
      600: Color.fromRGBO(0, 234, 53, .7),
      700: Color.fromRGBO(0, 234, 53, .8),
      800: Color.fromRGBO(0, 234, 53, .9),
      900: Color.fromRGBO(0, 234, 53, 1),

    },
  );
}



