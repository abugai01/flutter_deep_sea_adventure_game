import 'package:flutter/material.dart';
import 'package:flutter_deep_sea_adventure_game/config/style.dart';
import 'package:flutter_deep_sea_adventure_game/models/enums.dart';
import 'package:flutter_deep_sea_adventure_game/models/treasure_model.dart';
import 'package:flutter_deep_sea_adventure_game/widgets/player.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class Treasure extends StatelessWidget {
  final TreasureModel model;

  const Treasure(this.model, {Key? key}) : super(key: key);

  @override
  //todo: make a snake-like shape!
  //todo: handle circles!
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        height: 60,
        width: 60,
        //todo: not hardcode size?
        child: model.type == TreasureType.circle
            ? Container(
                //todo: what about this circle's size?
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              )
            : Container(
                decoration: ShapeDecoration(
                  color: model.color,
                  shape: PolygonBorder(
                    sides: model.numberOfSides ?? 8,
                    borderRadius: 0,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: model.players.isEmpty
                      ? _Dots(model.numberOfDotsDisplayed)
                      :
                      //todo: better looking multiple icons?
                      Row(
                          children: model.players
                              .map((player) => Player(player))
                              .toList(),
                        ),
                ),
              ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int value;

  const _Dots(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      //todo: not hardcode size?
      child: Stack(
        fit: StackFit.expand,
        children: [
          Visibility(
            visible: value == 1,
            child: const Align(
              alignment: Alignment.center,
              child: _Dot(),
            ),
          ),
          Visibility(
            visible: value == 2 || value == 4,
            child: const Align(
              alignment: Alignment.topLeft,
              child: _Dot(),
            ),
          ),
          Visibility(
            visible: value == 2 || value == 3 || value == 4,
            child: const Align(
              alignment: Alignment.bottomRight,
              child: _Dot(),
            ),
          ),
          Visibility(
            visible: value == 3 || value == 4,
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: _Dot(),
            ),
          ),
          Visibility(
            visible: value == 3,
            child: const Align(
              alignment: Alignment.topCenter,
              child: _Dot(),
            ),
          ),
          Visibility(
            visible: value == 4,
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
      padding: const EdgeInsets.all(2.5),
      child: Container(
        height: 5,
        width: 5,
        decoration: const BoxDecoration(
          color: white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
