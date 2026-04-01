import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/utils/app_styles.dart';
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


class ScoreWidget extends StatelessWidget {
  final int score;

  const ScoreWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.scorePadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            Icons.star_border_purple500_rounded,
            size: 16.sp,
            color: Colors.black,
          ),
          SizedBox(width: 5.w),
          Text(
            score.toString(),
            style: AppStyles.score,
          ),
        ],
      ),
    );
  }
}