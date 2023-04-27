import 'package:flutter/material.dart';
import 'package:survivor/components/playersItem.dart';
import 'package:survivor/data/dummy_data_players.dart';
import 'package:survivor/models/Players.dart';

class CreatePlayerPage extends StatefulWidget {
  final List<Players> loadPlayers = dummyPlayers;
   CreatePlayerPage({Key? key}) : super(key: key);

  @override
  State<CreatePlayerPage> createState() => _CreatePlayerPageState();
}

class _CreatePlayerPageState extends State<CreatePlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.loadPlayers.length,
        itemBuilder: (ctx, i ) => PlayerItems(players: widget.loadPlayers[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 10,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
