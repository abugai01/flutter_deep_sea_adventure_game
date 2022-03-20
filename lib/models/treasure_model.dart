import 'dart:ui';

import 'package:flutter_deep_sea_adventure_game/helpers/game_helper.dart';
import 'package:flutter_deep_sea_adventure_game/models/enums.dart';
import 'package:flutter_deep_sea_adventure_game/models/player_model.dart';

class TreasureModel {
  final TreasureType type;
  late final int points;
  List<PlayerModel> players;

  TreasureModel({required this.type, required this.points})
      : players = <PlayerModel>[];

  void addPlayer(PlayerModel player) {
    for (int i = 0; i < players.length; i++) {
      if (player.index == players[i].index) {
        return;
      }
    }
    players.add(player);
  }

  void removePlayer(PlayerModel player) {
    for (int i = 0; i < players.length; i++) {
      if (player.index == players[i].index) {
        players.removeAt(i);
        break;
      }
    }
  }

  //bool get isPlaceholder => type == TreasureType.circle;
  int get numberOfDotsDisplayed =>
      GameHelper.getNumberOfDotsDisplayedByType(type);
  int? get numberOfSides => GameHelper.getNumberOfSidesByType(type);
  Color get color => GameHelper.getTreasureColorByType(type);
}
