import 'package:flutter/material.dart';
import 'package:survivor/core/theme/AppColors.dart';
import 'package:survivor/data/dummy_data_players.dart';
import 'package:survivor/models/Players.dart';
import 'package:survivor/pages/PlayerDetailPage.dart';
import 'package:survivor/utils/AppRoutes.dart';

class PlayerItems extends StatefulWidget {
  final List<Players> loadPlayers = dummyPlayers;
  final Players players;

  PlayerItems({Key? key, required this.players}) : super(key: key);

  @override
  State<PlayerItems> createState() => _PlayerItemsState();
}

class _PlayerItemsState extends State<PlayerItems> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.loadPlayers.length.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(
              )
            ),
            Text(
              widget.players.name,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.players.points.toString(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.PLAYER_DETAIL, arguments: widget.players).onError((error, stackTrace) {
                    print('Error while navigating to player detail page: $error');
                    print(stackTrace);
                  });
              },
              child: Icon(Icons.remove_red_eye_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
