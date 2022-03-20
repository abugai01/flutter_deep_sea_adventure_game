import 'package:flutter_deep_sea_adventure_game/models/game_model.dart';

abstract class GameState {}

class GameInitState extends GameState {}

class GameGenericState extends GameState {
  final GameModel game;

  GameGenericState({required this.game});
}
