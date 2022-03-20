import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_deep_sea_adventure_game/config/constants.dart';
import 'package:flutter_deep_sea_adventure_game/config/style.dart';
import 'package:flutter_deep_sea_adventure_game/models/enums.dart';

class GameHelper {
  static TreasureType getTreasureTypeByLevel(int level) {
    assert(level < Constants.numberOfTreasureTypes && level >= 0);

    switch (level) {
      case 0:
        return TreasureType.triangle;
      case 1:
        return TreasureType.square;
      case 2:
        return TreasureType.pentagon;
      case 3:
        return TreasureType.hexagon;
      default:
        return TreasureType.circle;
    }
  }

  static List<int> generatePointsArrayByType(TreasureType type) {
    List<int>? points = _pointsMap[type];

    assert(points != null &&
        points.length == Constants.numberOfTreasuresOfEachType);

    return points!.toList()..shuffle();
  }

  // The points are distributed as follows:
  // Level 1 (triangles): 0-3
  // Level 2 (squares):   4-7
  // Level 3 (pentagons): 8-11
  // Level 4 (hexagons):  12-15
  static const Map<TreasureType, List<int>> _pointsMap = {
    TreasureType.triangle: [0, 0, 1, 1, 2, 2, 3, 3],
    TreasureType.square: [4, 4, 5, 5, 6, 6, 7, 7],
    TreasureType.pentagon: [8, 8, 9, 9, 10, 10, 11, 11],
    TreasureType.hexagon: [12, 12, 13, 13, 14, 14, 15, 15],
  };

  static int getNumberOfDotsDisplayedByType(TreasureType type) {
    switch (type) {
      case TreasureType.triangle:
        return 1;
      case TreasureType.square:
        return 2;
      case TreasureType.pentagon:
        return 3;
      case TreasureType.hexagon:
        return 4;
      default:
        return 0;
    }
  }

  static Color getTreasureColorByType(TreasureType type) {
    switch (type) {
      case TreasureType.circle:
        return themeBlue1;
      case TreasureType.triangle:
        return themeBlue1;
      case TreasureType.square:
        return themeBlue2;
      case TreasureType.pentagon:
        return themeBlue3;
      case TreasureType.hexagon:
        return themeBlue4;
      // default:
      //   return themeBlue1;
    }
  }

  static int? getNumberOfSidesByType(TreasureType type) {
    switch (type) {
      case TreasureType.triangle:
        return 3;
      case TreasureType.square:
        return 4;
      case TreasureType.pentagon:
        return 5;
      case TreasureType.hexagon:
        return 6;
      default:
        return null;
    }
  }

  static Color getPlayerColorByIndex(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.green;
      case 3:
        return Colors.purple;
      case 4:
        return Colors.orange;
      default:
        return black;
    }
  }

  static int getNextPlayerIndex(int currentPlayer) {
    if (currentPlayer == Constants.numberOfPlayers - 1) {
      return 0;
    } else {
      return currentPlayer + 1;
    }
  }
}
