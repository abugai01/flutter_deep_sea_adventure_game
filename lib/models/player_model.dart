import 'dart:math';
import 'dart:ui';

import 'package:flutter_deep_sea_adventure_game/config/constants.dart';
import 'package:flutter_deep_sea_adventure_game/helpers/game_helper.dart';
import 'package:flutter_deep_sea_adventure_game/models/enums.dart';

class PlayerModel {
  final int index;
  PlayerMoveDirection moveDirection;
  final Color color;
  int position; // Note that position 0 means that the player is on the submarine, i.e. at the start
  bool hasReturned;

  PlayerModel(this.index)
      : moveDirection = PlayerMoveDirection.down,
        color = GameHelper.getPlayerColorByIndex(index),
        position = 0,
        hasReturned = false;

  // A value is return for the game model to know the new position and pass it to the corresponding treasure
  int makeMove(PlayerAction action, int points) {
    //todo: logic, restrictions, etc.

    if (action == PlayerAction.moveDown) {
      position = min(Constants.numberOfTreasures, position + points);
    } else if (action == PlayerAction.moveUp ||
        action == PlayerAction.grabAndMoveUp) {
      position = max(0, position - points);
    }

    return position;
  }
}
