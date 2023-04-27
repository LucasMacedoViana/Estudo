import 'package:flutter/material.dart';
import 'package:survivor/models/Players.dart';

class PlayerDatailPage extends StatefulWidget {
  const PlayerDatailPage({Key? key}) : super(key: key);

  @override
  State<PlayerDatailPage> createState() => _PlayerDatailPageState();
}

class _PlayerDatailPageState extends State<PlayerDatailPage> {
  late Players player = ModalRoute.of(context)!.settings.arguments as Players;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
      ),
    );
  }
}
