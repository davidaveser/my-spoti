import 'package:my_spoti/stores/preferences.store.dart';
import 'package:provider/provider.dart';

abstract class Providers {
  static List<Provider> get providers {
    return [
      Provider<PreferencesStore>(create: (_) => PreferencesStore()),
    ];
  }
}
