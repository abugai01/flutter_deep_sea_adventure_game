import 'package:flutter/material.dart';
import 'package:flutter_deep_sea_adventure_game/config/style.dart';
import 'package:flutter_deep_sea_adventure_game/models/dice_model.dart';

//todo: cool animation!
class Dice extends StatelessWidget {
  final DiceModel model;

  const Dice(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => context.read<GameCubit>().throwDice(), //todo: remove gesture detector if not needed!
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          _Die(model.res1 ?? 0),
          const SizedBox(height: 5),
          _Die(model.res2 ?? 0), //todo: null safety?
          const SizedBox(height: 5),
          Text(model.res1.toString() +
              '+' +
              model.res2.toString() +
              '=' +
              model.sum.toString()), //todo: remove later!
        ]),
      ),
    );
  }
}

class _Die extends StatelessWidget {
  final int value;

  const _Die(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      //todo: not hardcode size?
      color: Colors.yellow,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Visibility(
            visible: value == 2 || value == 3,
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: _Dot(),
            ),
          ),
          Visibility(
            visible: value == 1 || value == 3,
            child: const Align(
              alignment: Alignment.center,
              child: _Dot(),
            ),
          ),
          Visibility(
            visible: value == 2 || value == 3,
            child: const Align(
              alignment: Alignment.topRight,
              child: _Dot(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 8,
        width: 8,
        decoration: const BoxDecoration(
          color: black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
