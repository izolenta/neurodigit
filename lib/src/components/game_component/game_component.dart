import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:neurodigit/src/actions/start_game_action.dart';
import 'package:neurodigit/src/components/game_component/board_component/board_component.dart';
import 'package:neurodigit/src/services/game_dispatcher.dart';
import 'package:neurodigit/src/services/game_providers.dart';
import 'package:neurodigit/src/services/game_selector.dart';
import 'package:neurodigit/src/state/game_state.dart';
import 'package:redux/redux.dart';

@Component(
  selector: 'snake-game',
  styleUrls: ['game_component.css'],
  templateUrl: 'game_component.html',
  directives: [BoardComponent],
  providers: [GameProviders.providers],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class GameComponent implements OnDestroy {
  final Store<GameState> _store;
  final NgZone _zone;
  final ChangeDetectorRef _detector;
  final GameDispatcher _dispatcher;
  final List<StreamSubscription> _subscriptions = [];
  final GameSelector _selector;

  Timer _gameTimer;

  GameState get state => _store.state;

  GameComponent(
      this._store,
      this._zone,
      this._detector,
      this._dispatcher,
      this._selector)
  {
    _init();
  }
  void _init() {
    _zone.runOutsideAngular(() {
      _subscriptions.addAll([
        _store.onChange.listen((_) {
          _zone.run(_detector.markForCheck);
        }),
        _dispatcher.onAction.listen(_store.dispatch),
      ]);
    });
  }

  @override
  void ngOnDestroy() {
    _gameTimer.cancel();
    _subscriptions.clear();
    _store?.teardown();
  }
}
