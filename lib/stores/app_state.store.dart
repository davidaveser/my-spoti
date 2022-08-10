import 'package:mobx/mobx.dart';
import 'package:my_spoti/constants/enums.constants.dart';

part 'app_state.store.g.dart';

class AppStateStore = AppStateWithStore with _$AppStateStore;

abstract class AppStateWithStore with Store {
  /// The current section selected.
  @observable
  AppSections appSection = AppSections.home;

  /// True if the current section selected is Home.
  @computed
  bool get homeSelected => appSection == AppSections.home;

  /// True if the current section selected is Search.
  @computed
  bool get searchSelected => appSection == AppSections.search;

  /// Reset variables to the initial values.
  @action
  void cleanStore() {
    appSection = AppSections.home;
  }
}
