import 'package:alura/data/task_inherited.dart';
import 'package:alura/screens/form_screen.dart';
import 'package:alura/screens/initail_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}





