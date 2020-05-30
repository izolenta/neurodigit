import 'dart:math';

import 'package:built_value/built_value.dart';
import 'package:neurodigit/src/state/game_state.dart';

import '../constants.dart';

class GameSelector {

  @memoized
  List<int> getDigitIndexes(GameState state) => state.digitPoints.toList();

  @memoized
  List<int> getResults(GameState state) => state.results.toList();

  bool isCalculating(GameState state) => state.digitPoints.isNotEmpty;

  @memoized
  bool isFilledAtCell(GameState state, int x, int y) => state.digitPoints.contains(y * boardWidth + x);

  @memoized
  List<double> getFieldData(GameState state) {
    final result = <double>[];
    for (var i=0; i<boardHeight; i++) {
      for (var j=0; j<boardWidth; j++) {
        result.add(isFilledAtCell(state, j, i)? 1.0 : 0.0);
      }
    }
    return result;
  }
}
