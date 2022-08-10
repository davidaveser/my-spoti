// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStateStore on AppStateWithStore, Store {
  Computed<bool>? _$homeSelectedComputed;

  @override
  bool get homeSelected =>
      (_$homeSelectedComputed ??= Computed<bool>(() => super.homeSelected,
              name: 'AppStateWithStore.homeSelected'))
          .value;
  Computed<bool>? _$searchSelectedComputed;

  @override
  bool get searchSelected =>
      (_$searchSelectedComputed ??= Computed<bool>(() => super.searchSelected,
              name: 'AppStateWithStore.searchSelected'))
          .value;

  late final _$appSectionAtom =
      Atom(name: 'AppStateWithStore.appSection', context: context);

  @override
  AppSections get appSection {
    _$appSectionAtom.reportRead();
    return super.appSection;
  }

  @override
  set appSection(AppSections value) {
    _$appSectionAtom.reportWrite(value, super.appSection, () {
      super.appSection = value;
    });
  }

  late final _$AppStateWithStoreActionController =
      ActionController(name: 'AppStateWithStore', context: context);

  @override
  void cleanStore() {
    final _$actionInfo = _$AppStateWithStoreActionController.startAction(
        name: 'AppStateWithStore.cleanStore');
    try {
      return super.cleanStore();
    } finally {
      _$AppStateWithStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appSection: ${appSection},
homeSelected: ${homeSelected},
searchSelected: ${searchSelected}
    ''';
  }
}
