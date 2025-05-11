import 'package:articles_app_bharatnxt_assignment/core/constants/shared_prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences _preferences;

  SharedPreferencesHelper(this._preferences);

  Future<void> setStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }

  List<String> getStringList(String key) {
    return _preferences.getStringList(key) ?? [];
  }

  Future<void> saveFavoriteArticles(String article) async {
    List<String> savedFavoriteArticles = getStringList(SharedPrefsConstants.favoriteArticles);
    savedFavoriteArticles.add(article);
    await setStringList(SharedPrefsConstants.favoriteArticles, savedFavoriteArticles);
  }
}
