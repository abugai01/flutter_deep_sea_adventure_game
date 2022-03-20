import 'dart:core';

class Constants {
  static const int numberOfTreasureTypes = 4;
  static const int numberOfTreasuresOfEachType = 8;

  static int get numberOfTreasures =>
      numberOfTreasureTypes * numberOfTreasuresOfEachType;

  static const int oxygenUnits = 25;
  static const int numberOfPlayers = 2; //todo: adapt for more players!
}
