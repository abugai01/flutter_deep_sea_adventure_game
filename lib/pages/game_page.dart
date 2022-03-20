import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deep_sea_adventure_game/config/style.dart';
import 'package:flutter_deep_sea_adventure_game/cubits/game_cubit.dart';
import 'package:flutter_deep_sea_adventure_game/cubits/states/game_state.dart';
import 'package:flutter_deep_sea_adventure_game/models/enums.dart';
import 'package:flutter_deep_sea_adventure_game/widgets/dice.dart';
import 'package:flutter_deep_sea_adventure_game/widgets/submarine.dart';
import 'package:flutter_deep_sea_adventure_game/widgets/treasure.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'DEEP SEA ADVENTURE',
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: white,
        //todo: implement rules
        actions: [
          // IconButton(
          //     onPressed: () => showInformationWindow(context,
          //         title: 'HOW TO PLAY', content: const Rules()),
          //     icon: const Icon(
          //       Icons.help_outline_outlined,
          //       color: black,
          //     )),
          IconButton(
              onPressed: () => context.read<GameCubit>().newGame(),
              icon: const Icon(
                Icons.autorenew,
                color: black,
              )),
        ],
      ),
      body: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
        if (state is GameGenericState) {
          return ListView.builder(
              itemCount: state.game.treasures.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  //todo: remove this bs
                  return Row(children: [
                    Expanded(child: Submarine(state.game.submarine)),
                    Column(
                      children: [
                        Text(
                            'Player ${state.game.activePlayerIndex + 1}\'s move'),
                        TextButton(
                            onPressed: () => context
                                .read<GameCubit>()
                                .makeMove(PlayerAction.moveUp),
                            child: Text('Up')),
                        TextButton(
                            onPressed: () => context
                                .read<GameCubit>()
                                .makeMove(PlayerAction.grabAndMoveUp),
                            child: Text('Grab and Up')),
                        TextButton(
                            onPressed: () => context
                                .read<GameCubit>()
                                .makeMove(PlayerAction.moveDown),
                            child: Text('Down')),
                      ],
                    ),
                    Dice(state.game.dice),
                  ]);
                } else {
                  assert(state.game.treasures[index - 1] != null);
                  return Treasure(state.game.treasures[index - 1]!);
                }
              });
        } else {
          return const Center(child: Text('Sorry, something went wrong'));
        }
      }),
    );
  }
}
