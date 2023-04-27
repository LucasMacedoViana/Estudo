import 'package:flutter/material.dart';
import 'package:survivor/core/theme/AppTheme.dart';
import 'package:survivor/pages/CreatePlayerPage.dart';
import 'package:survivor/pages/HomePage.dart';
import 'package:survivor/pages/PlayerDetailPage.dart';
import 'package:survivor/utils/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Survivor',
      theme: AppTheme().theme(),
      home: CreatePlayerPage(),
      routes:{
        AppRoutes.HOME: (ctx) => HomePage(),
        AppRoutes.PLAYER_DETAIL: (ctx) => PlayerDatailPage(),
      } ,
    );
  }
}