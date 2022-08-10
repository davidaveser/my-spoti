// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStateStore on AppStateWithStore, Store {
  Computed<bool>? _$isMainSectionSelectedComputed;

  @override
  bool get isMainSectionSelected => (_$isMainSectionSelectedComputed ??=
          Computed<bool>(() => super.isMainSectionSelected,
              name: 'AppStateWithStore.isMainSectionSelected'))
      .value;
  Computed<bool>? _$isSearchSectionSelectedComputed;

  @override
  bool get isSearchSectionSelected => (_$isSearchSectionSelectedComputed ??=
          Computed<bool>(() => super.isSearchSectionSelected,
              name: 'AppStateWithStore.isSearchSectionSelected'))
      .value;

  late final _$homeSectionSelectedAtom =
      Atom(name: 'AppStateWithStore.homeSectionSelected', context: context);

  @override
  AppSections get homeSectionSelected {
    _$homeSectionSelectedAtom.reportRead();
    return super.homeSectionSelected;
  }

  @override
  set homeSectionSelected(AppSections value) {
    _$homeSectionSelectedAtom.reportWrite(value, super.homeSectionSelected, () {
      super.homeSectionSelected = value;
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
homeSectionSelected: ${homeSectionSelected},
isMainSectionSelected: ${isMainSectionSelected},
isSearchSectionSelected: ${isSearchSectionSelected}
    ''';
  }
}
