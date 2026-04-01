import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle appBarTitle = TextStyle(
    fontSize: 13.sp,
    color: Colors.white,
    wordSpacing: 1.sp,
    letterSpacing: 0.3.sp,
  );

  static TextStyle score = TextStyle(
    fontSize: 13.sp,
    color: Colors.white,
  );

  static TextStyle buttonText = TextStyle(
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );
  // ================= ICON =================
  static Icon starIcon() {
    return Icon(
      Icons.star_border_purple500_rounded,
      size: 16.sp,
      color: Colors.black,
    );
  }

  // ================= PADDING =================
  static EdgeInsets scorePadding = EdgeInsets.only(right: 5.w);
}