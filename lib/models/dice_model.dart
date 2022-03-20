import 'dart:math';

class DiceModel {
  int? res1;
  int? res2;

  DiceModel();

  void throwDice() {
    res1 = outcomes[Random().nextInt(outcomes.length)];
    res2 = outcomes[Random().nextInt(outcomes.length)];
  }

  int get sum => (res1 ?? 0) + (res2 ?? 0);

  static const List<int> outcomes = [1, 2, 3];
}
