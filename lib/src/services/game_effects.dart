import 'package:neurodigit/src/actions/start_game_action.dart';
import 'package:neurodigit/src/state/game_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

import 'game_selector.dart';

class GameEffects {

  final GameSelector _selector;

  GameEffects(this._selector);

  Epic<GameState> getEffects() {
    return combineEpics([
      TypedEpic<GameState, StartGameAction>(_onGameStart),
    ]);
  }

  Stream<Object> _onGameStart(Stream<StartGameAction> actions, EpicStore<GameState> store) =>
      Observable(actions).asyncExpand((action) async* {
      });
}
