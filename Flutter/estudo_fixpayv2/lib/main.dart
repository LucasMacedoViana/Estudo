import 'package:alura/data/task_inherited.dart';
import 'package:alura/screens/form_screen.dart';
import 'package:alura/screens/redefinir_senha.dart';
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
      title: 'FixPay v2',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: TaskInherited(child: const AccessScreen()),
    );
  }
}





