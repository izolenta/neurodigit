import 'dart:math';

import 'package:angular/angular.dart';
import 'package:neurodigit/src/services/game_selector.dart';
import 'package:neurodigit/src/services/game_service.dart';
import 'package:neurodigit/src/state/game_state.dart';

@Component(
  selector: 'results',
  styleUrls: ['results_component.css'],
  templateUrl: 'results_component.html',
  directives: [NgFor],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class ResultsComponent {

  static const defaultResults = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  @Input()
  GameState state;

  final GameSelector _selector;

  List<int> get results => _selector.getResults(state);

  int getBarLength(int index) => results[index];

  bool isMaxed(int index) {
    final maximal = results.reduce(max);
    return results[index] == maximal;
  }
  ResultsComponent(this._selector);
}
