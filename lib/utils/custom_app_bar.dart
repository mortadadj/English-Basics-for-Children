import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/utils/app_styles.dart';
import 'package:jeux/utils/score_manager.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}

class _CustomAppBarState extends State<CustomAppBar> {


  @override


  @override
  Widget build(BuildContext context) {
    // 🔥 Vérifier si ScreenUtil est prêt
    if (1.sw == 0) {
      return AppBar(); // fallback temporaire
    }

    return AppBar(
      backgroundColor: const Color.fromARGB(223, 225, 124, 0),
      toolbarHeight: 55.h,
      title: Text(
        "Learn with Stitche",
        style: AppStyles.appBarTitle,
      ),
      leading: const Image(
        image: AssetImage("images/stitch.png"),
      ),
      actions: [
        FutureBuilder<int>(
          future: ScoreManager.getScore(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(); // ou CircularProgressIndicator()
            }

            final score = snapshot.data!;

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
          },
        ),
      ],

    );
  }
}