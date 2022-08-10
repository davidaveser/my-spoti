// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PreferencesStore on PreferencesStoreS, Store {
  late final _$isLoggedAtom =
      Atom(name: 'PreferencesStoreS.isLogged', context: context);

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  late final _$PreferencesStoreSActionController =
      ActionController(name: 'PreferencesStoreS', context: context);

  @override
  void cleanStore() {
    final _$actionInfo = _$PreferencesStoreSActionController.startAction(
        name: 'PreferencesStoreS.cleanStore');
    try {
      return super.cleanStore();
    } finally {
      _$PreferencesStoreSActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogged: ${isLogged}
    ''';
  }
}
