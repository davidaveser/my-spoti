import 'package:mobx/mobx.dart';

part 'preferences.store.g.dart';

class PreferencesStore = PreferencesStoreS with _$PreferencesStore;

abstract class PreferencesStoreS with Store {
  /// True if the user was logged.
  @observable
  bool isLogged = false;

  /// Reset variables to the initial values.
  @action
  void cleanStore() {
    isLogged = false;
  }
}
