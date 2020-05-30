import 'package:angular/angular.dart';
import 'package:neurodigit/src/constants.dart';
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

  @Input()
  GameState state;

  final GameSelector _selector;

  final _fieldIndexesWidth = <int>[];
  List<int> get fieldIndexesWidth => _fieldIndexesWidth;

  final _fieldIndexesHeight = <int>[];
  List<int> get fieldIndexesHeight => _fieldIndexesHeight;

  BoardComponent(this._selector) {
    for (var i=0; i< boardWidth; i++) {
      _fieldIndexesWidth.add(i);
    }
    for (var i=0; i< boardHeight; i++) {
      _fieldIndexesHeight.add(i);
    }
  }
}
