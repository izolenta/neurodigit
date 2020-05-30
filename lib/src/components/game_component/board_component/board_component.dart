import 'dart:html';

import 'package:angular/angular.dart';
import 'package:neurodigit/src/actions/fire_cell_action.dart';
import 'package:neurodigit/src/actions/run_calc_action.dart';
import 'package:neurodigit/src/constants.dart';
import 'package:neurodigit/src/services/game_dispatcher.dart';
import 'package:neurodigit/src/services/game_selector.dart';
import 'package:neurodigit/src/state/game_state.dart';

@Component(
  selector: 'board',
  styleUrls: ['board_component.css'],
  templateUrl: 'board_component.html',
  directives: [NgFor],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class BoardComponent {

  var _mousePressed = false;

  @Input()
  GameState state;

  final GameSelector _selector;
  final GameDispatcher _dispatcher;

  final _fieldIndexesWidth = <int>[];
  List<int> get fieldIndexesWidth => _fieldIndexesWidth;

  final _fieldIndexesHeight = <int>[];
  List<int> get fieldIndexesHeight => _fieldIndexesHeight;

  bool isFilledAtCell(int x, int y) => _selector.isFilledAtCell(state, x, y);

  BoardComponent(this._selector, this._dispatcher) {
    for (var i=0; i< boardWidth; i++) {
      _fieldIndexesWidth.add(i);
    }
    for (var i=0; i< boardHeight; i++) {
      _fieldIndexesHeight.add(i);
    }
  }

  void onMouseDownParent() {
    _mousePressed = true;
  }

  void onMouseDown(int x, int y) {
    _mousePressed = true;
    _dispatcher.dispatch(FireCellAction(y * boardWidth + x));
  }

  void onMouseUp() {
    _mousePressed = false;
    _dispatcher.dispatch(RunCalcAction());
  }

  void onMouseMove(int x, int y) {
    if (_mousePressed) {
      _dispatcher.dispatch(FireCellAction(y * boardWidth + x));
    }
    else {
    }
  }
}
