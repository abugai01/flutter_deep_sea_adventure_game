import 'package:flutter_deep_sea_adventure_game/config/constants.dart';
import 'package:flutter_deep_sea_adventure_game/models/player_model.dart';

class SubmarineModel {
  final int oxygenLevel;
  List<PlayerModel> players;

  SubmarineModel(this.players) : oxygenLevel = Constants.oxygenUnits;

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
}
