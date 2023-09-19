// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerStore on _PlayerStore, Store {
  late final _$idAtom = Atom(name: '_PlayerStore.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$idxAtom = Atom(name: '_PlayerStore.idx', context: context);

  @override
  int get idx {
    _$idxAtom.reportRead();
    return super.idx;
  }

  @override
  set idx(int value) {
    _$idxAtom.reportWrite(value, super.idx, () {
      super.idx = value;
    });
  }

  late final _$bookAtom = Atom(name: '_PlayerStore.book', context: context);

  @override
  AudiobookFull? get book {
    _$bookAtom.reportRead();
    return super.book;
  }

  @override
  set book(AudiobookFull? value) {
    _$bookAtom.reportWrite(value, super.book, () {
      super.book = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_PlayerStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$bgColorAtom =
      Atom(name: '_PlayerStore.bgColor', context: context);

  @override
  Color get bgColor {
    _$bgColorAtom.reportRead();
    return super.bgColor;
  }

  @override
  set bgColor(Color value) {
    _$bgColorAtom.reportWrite(value, super.bgColor, () {
      super.bgColor = value;
    });
  }

  late final _$accentColorAtom =
      Atom(name: '_PlayerStore.accentColor', context: context);

  @override
  Color get accentColor {
    _$accentColorAtom.reportRead();
    return super.accentColor;
  }

  @override
  set accentColor(Color value) {
    _$accentColorAtom.reportWrite(value, super.accentColor, () {
      super.accentColor = value;
    });
  }

  late final _$seekTimeAtom =
      Atom(name: '_PlayerStore.seekTime', context: context);

  @override
  int get seekTime {
    _$seekTimeAtom.reportRead();
    return super.seekTime;
  }

  @override
  set seekTime(int value) {
    _$seekTimeAtom.reportWrite(value, super.seekTime, () {
      super.seekTime = value;
    });
  }

  late final _$persistColorsAsyncAction =
      AsyncAction('_PlayerStore.persistColors', context: context);

  @override
  Future<void> persistColors() {
    return _$persistColorsAsyncAction.run(() => super.persistColors());
  }

  late final _$playAsyncAction =
      AsyncAction('_PlayerStore.play', context: context);

  @override
  Future<void> play(int i) {
    return _$playAsyncAction.run(() => super.play(i));
  }

  late final _$persistSeekTimeAsyncAction =
      AsyncAction('_PlayerStore.persistSeekTime', context: context);

  @override
  Future<void> persistSeekTime() {
    return _$persistSeekTimeAsyncAction.run(() => super.persistSeekTime());
  }

  late final _$_PlayerStoreActionController =
      ActionController(name: '_PlayerStore', context: context);

  @override
  void loadColors() {
    final _$actionInfo = _$_PlayerStoreActionController.startAction(
        name: '_PlayerStore.loadColors');
    try {
      return super.loadColors();
    } finally {
      _$_PlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadSeekTime() {
    final _$actionInfo = _$_PlayerStoreActionController.startAction(
        name: '_PlayerStore.loadSeekTime');
    try {
      return super.loadSeekTime();
    } finally {
      _$_PlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
idx: ${idx},
book: ${book},
loading: ${loading},
bgColor: ${bgColor},
accentColor: ${accentColor},
seekTime: ${seekTime}
    ''';
  }
}
