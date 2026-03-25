import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/animls/animls_carton.dart';
import 'package:video_player/video_player.dart';

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
          "CARTON",
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.white,
            wordSpacing: 1.sp,
            letterSpacing: 0.3.sp,
          ),
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
          Icon(
            Icons.star_border_purple500_rounded,
            size: 16.sp,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              "100",
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
            ),
          )
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
