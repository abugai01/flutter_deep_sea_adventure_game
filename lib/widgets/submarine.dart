import 'package:flutter/material.dart';
import 'package:flutter_deep_sea_adventure_game/models/submarine_model.dart';
import 'package:flutter_deep_sea_adventure_game/widgets/player.dart';

class Submarine extends StatelessWidget {
  final SubmarineModel model;

  const Submarine(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      color: Colors.blue,
      child: Column(children: [
        Text(
          model.oxygenLevel.toString(),
          style: TextStyle(fontSize: 40),
        ),
        Row(
          children: model.players.map((player) => Player(player)).toList(),
        ),
      ]),
    );
  }
}
