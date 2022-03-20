import 'package:flutter/material.dart';
import 'package:flutter_deep_sea_adventure_game/models/player_model.dart';

class Player extends StatelessWidget {
  final PlayerModel model;

  const Player(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.directions_walk_outlined,
      color: model.color,
    );
  }
}
