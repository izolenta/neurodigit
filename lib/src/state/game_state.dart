library neurodigit.state.game_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'game_state.g.dart';

abstract class GameState implements Built<GameState, GameStateBuilder> {
  factory GameState([void Function(GameStateBuilder b) updates]) = _$GameState;

  GameState._();

  BuiltList<int> get digitPoints;

  BuiltList<int> get results;
}