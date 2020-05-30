import 'dart:math';

import 'package:built_value/built_value.dart';
import 'package:neurodigit/src/state/game_state.dart';

import '../constants.dart';

class GameSelector {

  @memoized
  List<int> getDigitIndexes(GameState state) => state.digitPoints.toList();

  bool isCalculating(GameState state) => state.digitPoints.isNotEmpty;

}
