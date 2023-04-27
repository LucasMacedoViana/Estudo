import 'package:flutter/material.dart';
import 'package:survivor/components/playersItem.dart';
import 'package:survivor/data/dummy_data_players.dart';
import 'package:survivor/models/Players.dart';

class HomePage extends StatefulWidget {
  final List<Players> loadPlayers = dummyPlayers;
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
    );
  }
}

