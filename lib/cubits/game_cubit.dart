import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deep_sea_adventure_game/cubits/states/game_state.dart';
import 'package:flutter_deep_sea_adventure_game/models/enums.dart';
import 'package:flutter_deep_sea_adventure_game/models/game_model.dart';

class GameCubit extends Cubit<GameState> {
  late GameModel _game;

  GameCubit() : super(GameInitState()) {
    _game = GameModel.start();
    emit(GameGenericState(game: _game));
  }

  // //todo: remove or put inside model?
  // void throwDice() {
  //   _game.dice.throwDice();
  //   //todo: this is some kind of doubling now, no need to emit 2 states when throwing dice!
  //   emit(GameGenericState(game: _game));
  // }

  void makeMove(PlayerAction action) {
    _game.makeMove(action);
    emit(GameGenericState(game: _game));
  }

  void newGame() {
    _game = GameModel.start();
    emit(GameGenericState(game: _game));
  }
}
