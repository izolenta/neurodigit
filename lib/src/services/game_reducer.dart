import 'dart:math';

import 'package:neurodigit/src/actions/fire_cell_action.dart';
import 'package:neurodigit/src/actions/run_calc_action_success.dart';
import 'package:neurodigit/src/actions/start_game_action.dart';
import 'package:neurodigit/src/services/game_selector.dart';
import 'package:neurodigit/src/state/game_state.dart';
import 'package:redux/redux.dart';


class GameReducer {

  final rand = Random();
  final GameSelector _selector;

  Reducer<GameState> _reducer;

  GameReducer(this._selector) {
    _reducer = combineReducers([
      TypedReducer<GameState, StartGameAction>(_onStartGame),
      TypedReducer<GameState, FireCellAction>(_onFireCell),
      TypedReducer<GameState, RunCalcActionSuccess>(_onCalcSuccess),
    ]);
  }

  GameState getState(GameState state, Object action) {
    return _reducer(state, action);
  }

  GameState _onStartGame(GameState state, StartGameAction action) =>
    state.rebuild((s) {
      s
        ..digitPoints.clear()
        ..results.replace([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    });

  GameState _onFireCell(GameState state, FireCellAction action) =>
      state.rebuild((s) {
        s
          ..digitPoints.add(action.cellIndex);
      });

  GameState _onCalcSuccess(GameState state, RunCalcActionSuccess action) =>
      state.rebuild((s) {
        s
          ..results.replace(action.results);
      });


}