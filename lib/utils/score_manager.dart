import 'package:shared_preferences/shared_preferences.dart';

class ScoreManager {
  static const String _key = "global_score";

  static Future<int> getScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }

  static Future<void> setScore(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, value);
  }

  static Future<int> addPoint() async {
    final prefs = await SharedPreferences.getInstance();
    int current = prefs.getInt(_key) ?? 0;
    current++;
    await prefs.setInt(_key, current);
    return current;
  }
}
