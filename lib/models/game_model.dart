import 'package:flutter_deep_sea_adventure_game/config/constants.dart';
import 'package:flutter_deep_sea_adventure_game/helpers/game_helper.dart';
import 'package:flutter_deep_sea_adventure_game/models/dice_model.dart';
import 'package:flutter_deep_sea_adventure_game/models/enums.dart';
import 'package:flutter_deep_sea_adventure_game/models/player_model.dart';
import 'package:flutter_deep_sea_adventure_game/models/submarine_model.dart';
import 'package:flutter_deep_sea_adventure_game/models/treasure_model.dart';

class GameModel {
  GameStatus gameStatus;
  Map<int, TreasureModel> treasures;
  Map<int, PlayerModel> players;
  late SubmarineModel submarine;
  DiceModel dice;
  int activePlayerIndex;

  GameModel.start()
      : gameStatus = GameStatus.active,
        treasures = <int, TreasureModel>{},
        players = <int, PlayerModel>{},
        dice = DiceModel(),
        activePlayerIndex = 0 {
    _generateTreasures();
    _preparePlayers();
    submarine = SubmarineModel(players.entries.map((e) => e.value).toList());
  }

  void _generateTreasures() {
    for (int i = 0; i < Constants.numberOfTreasureTypes; i++) {
      TreasureType _type = GameHelper.getTreasureTypeByLevel(i);
      List<int> points = GameHelper.generatePointsArrayByType(_type);

      for (int j = 0; j < Constants.numberOfTreasuresOfEachType; j++) {
        treasures[i * Constants.numberOfTreasuresOfEachType + j] =
            TreasureModel(type: _type, points: points[j]);
      }
    }

    for (int k = 0; k < Constants.numberOfTreasures; k++) {
      assert(treasures[k] != null);
    }
  }

  void _preparePlayers() {
    for (int i = 0; i < Constants.numberOfPlayers; i++) {
      players[i] = PlayerModel(i);
    }
  }

  //todo: if player has returned, no more moving for him!
  //todo: grab treasures!
  //todo: slow down player by number of treasures!
  //  todo: spend oxygen!
  // todo: allow to change direction only once and then block the buttons!
  //todo: if reached the bottom, only way is up!
  void makeMove(PlayerAction action) {
    assert(players[activePlayerIndex] != null);

    dice.throwDice();

    //todo: maybe wrap it in another function?
    int oldPosition = players[activePlayerIndex]!.position;
    int newPosition = players[activePlayerIndex]!.makeMove(action, dice.sum);

    // Position differs from treasure index by 1, because zero position is reserved for the submarine
    int oldTreasureIndex = oldPosition - 1;
    int newTreasureIndex = newPosition - 1;

    // If the player actually moved, remove him from his last treasure and move to the current one
    if (oldPosition != newPosition) {
      if (oldPosition > 0) {
        assert(treasures[oldTreasureIndex] != null);
        treasures[oldTreasureIndex]!.removePlayer(activePlayer);
      } else if (oldPosition == 0) {
        submarine.removePlayer(activePlayer);
      }

      if (newPosition > 0) {
        assert(treasures[newTreasureIndex] != null);
        treasures[newTreasureIndex]!.addPlayer(activePlayer);
      } else if (newPosition == 0) {
        submarine.addPlayer(activePlayer);
      }
    }

    activePlayerIndex = GameHelper.getNextPlayerIndex(
        activePlayerIndex); //todo: make sure player has not returned! skip if returned

    _updateGameStatus();
  }

  void _updateGameStatus() {
    //todo: changed to end of round, etc.

    // Checking if oxygen has not depleted
    if (submarine.oxygenLevel <= 0) {
      gameStatus = GameStatus.lost;
      return;
    }

    // Checking if all players have already returned
    bool allPlayersReturned = true;
    for (PlayerModel player in players.values) {
      if (player.hasReturned == false) {
        allPlayersReturned = false;
      }
    }
    if (allPlayersReturned == true) {
      gameStatus = GameStatus.lost; //todo: not lost! round finished
      return;
    }
  }

  PlayerModel get activePlayer =>
      players[activePlayerIndex]!; //todo: null safety?
}
