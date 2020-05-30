import 'package:neurodigit/src/state/game_state.dart';

class GameStateFactory {
  GameState getInitialState() =>
      GameState((c) => c
            ..digitPoints.clear()
            ..results.replace([0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      );
}