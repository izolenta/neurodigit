// GENERATED CODE - DO NOT MODIFY BY HAND

part of neurodigit.state.game_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GameState extends GameState {
  @override
  final BuiltList<int> digitPoints;
  @override
  final BuiltList<int> results;

  factory _$GameState([void Function(GameStateBuilder) updates]) =>
      (new GameStateBuilder()..update(updates)).build();

  _$GameState._({this.digitPoints, this.results}) : super._() {
    if (digitPoints == null) {
      throw new BuiltValueNullFieldError('GameState', 'digitPoints');
    }
    if (results == null) {
      throw new BuiltValueNullFieldError('GameState', 'results');
    }
  }

  @override
  GameState rebuild(void Function(GameStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameStateBuilder toBuilder() => new GameStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameState &&
        digitPoints == other.digitPoints &&
        results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, digitPoints.hashCode), results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameState')
          ..add('digitPoints', digitPoints)
          ..add('results', results))
        .toString();
  }
}

class GameStateBuilder implements Builder<GameState, GameStateBuilder> {
  _$GameState _$v;

  ListBuilder<int> _digitPoints;
  ListBuilder<int> get digitPoints =>
      _$this._digitPoints ??= new ListBuilder<int>();
  set digitPoints(ListBuilder<int> digitPoints) =>
      _$this._digitPoints = digitPoints;

  ListBuilder<int> _results;
  ListBuilder<int> get results => _$this._results ??= new ListBuilder<int>();
  set results(ListBuilder<int> results) => _$this._results = results;

  GameStateBuilder();

  GameStateBuilder get _$this {
    if (_$v != null) {
      _digitPoints = _$v.digitPoints?.toBuilder();
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GameState;
  }

  @override
  void update(void Function(GameStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameState build() {
    _$GameState _$result;
    try {
      _$result = _$v ??
          new _$GameState._(
              digitPoints: digitPoints.build(), results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'digitPoints';
        digitPoints.build();
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GameState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
