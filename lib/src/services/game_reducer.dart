import 'dart:math';

import 'package:neurodigit/src/actions/start_game_action.dart';
import 'package:neurodigit/src/services/game_selector.dart';
import 'package:neurodigit/src/state/game_state.dart';
import 'package:redux/redux.dart';

import '../constants.dart';

class GameReducer {

  final rand = Random();
  final GameSelector _selector;

  Reducer<GameState> _reducer;

  GameReducer(this._selector) {
    _reducer = combineReducers([
      TypedReducer<GameState, StartGameAction>(_onStartGame),
    ]);
  }

  GameState getState(GameState state, Object action) {
    return _reducer(state, action);
  }

  GameState _onStartGame(GameState state, StartGameAction action) =>
    state.rebuild((s) {
    });

}