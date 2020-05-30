import 'package:neurodigit/src/actions/run_calc_action.dart';
import 'package:neurodigit/src/actions/run_calc_action_success.dart';
import 'package:neurodigit/src/actions/start_game_action.dart';
import 'package:neurodigit/src/services/game_service.dart';
import 'package:neurodigit/src/state/game_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

import 'game_selector.dart';

class GameEffects {

  final GameSelector _selector;
  final GameService _service;

  GameEffects(this._selector, this._service);

  Epic<GameState> getEffects() {
    return combineEpics([
      TypedEpic<GameState, RunCalcAction>(_onRunCalc),
    ]);
  }

  Stream<Object> _onRunCalc(Stream<RunCalcAction> actions, EpicStore<GameState> store) =>
      Observable(actions).asyncExpand((action) async* {
        yield RunCalcActionSuccess(_service.getResults(_selector.getFieldData(store.state)));
      });
}
