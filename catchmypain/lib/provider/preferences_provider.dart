import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

class PreferencesNotifier extends StateNotifier<Map<String, dynamic>> {
  PreferencesNotifier(this._sharedPreferencesFuture) : super({}) {
    _initialize();
  }

  final Future<SharedPreferences> _sharedPreferencesFuture;
  SharedPreferences? _sharedPreferences;

  Future<void> _initialize() async {
    _sharedPreferences = await _sharedPreferencesFuture;
  }

  void saveString(String key, String value) async {
    if (_sharedPreferences == null) {
      await _initialize();
    }
    state = {...state, key: value};
    _sharedPreferences?.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences?.getString(key);
  }
}

final preferencesNotifierProvider =
    StateNotifierProvider<PreferencesNotifier, Map<String, dynamic>>(
  (ref) {
    final sharedPreferencesFuture = ref.watch(sharedPreferencesProvider.future);
    return PreferencesNotifier(sharedPreferencesFuture);
  },
);
