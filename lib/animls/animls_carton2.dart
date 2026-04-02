import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/animls/animls_carton.dart';
import 'package:video_player/video_player.dart';

import '../utils/app_styles.dart';
import '../utils/score_manager.dart';

class animls_carton2 extends StatefulWidget {
  const animls_carton2({super.key});

  @override
  State<animls_carton2> createState() => _animls_carton2State();
}

class _animls_carton2State extends State<animls_carton2> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/animals_carton2.mp4')
          ..initialize().then((_) {
            _videoPlayerController.play();
            setState(() {});
          });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(223, 225, 124, 0),
        toolbarHeight: 55.h,
        title: Text(
          "CARTOON",
          style: AppStyles.appBarTitle,
        ),
        leading: IconButton(
          onPressed: () async {
            AudioPlayer player = AudioPlayer();
            Source path = AssetSource('return_ar.mp3');
            await player.play(path);

            var duration = const Duration(milliseconds: 900);
            sleep(duration);

            AudioPlayer player1 = AudioPlayer();
            Source path1 = AssetSource('return.mp3');
            await player1.play(path1);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => animls_carton(),
              ),
            );
          },
          icon: Icon(
            Icons.navigate_before_outlined,
            size: 16.sp,
            color: Colors.black,
          ),
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
      ),
      body: Center(
        child: _videoPlayerController.value.isInitialized
            ? VideoPlayer(_videoPlayerController)
            : Container(),
      ),
    );
  }
}
