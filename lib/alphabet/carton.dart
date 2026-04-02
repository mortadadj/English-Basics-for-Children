import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/alphabet/alphabet.dart';
import 'package:jeux/alphabet/carton4.dart';
import 'package:jeux/alphabet/carton1.dart';
import 'package:jeux/alphabet/carton2.dart';
import 'package:jeux/alphabet/carton3.dart';
import 'package:jeux/alphabet/learnAlphabets.dart';
import 'package:jeux/main.dart';
import 'package:jeux/widget/start.dart';
import 'package:jeux/utils/score_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';


class Card_carton {
  final String urlImage;
  final String titel;
  //final String audio;
  //final String audio_AR;
  final dynamic page_carton;
  const Card_carton({
    required this.urlImage,
    required this.titel,
    //required this.audio,
    //required this.audio_AR,
    required this.page_carton,
  });
}

class carton extends StatefulWidget {
  const carton({super.key});

  @override
  State<carton> createState() => _cartonState();
}

class _cartonState extends State<carton> {
  List<Card_carton> items = [
    Card_carton(
      urlImage: "images_carton/carton1.png",
      titel: 'Very esay',
      //audio: 'watch_carton.mp3',
      //audio_AR: 'watch_carton_ar.mp3',
      page_carton: carton1(),
    ),
    Card_carton(
      urlImage: "images_carton/carton2.png",
      titel: 'Super esay',
      page_carton: carton2(),
    ),
    Card_carton(
      urlImage: "images_carton/carton3.png",
      titel: 'Super esay 3 ',
      page_carton: carton3(),
    ),
    Card_carton(
      urlImage: "images_carton/carton4.png",
      titel: 'Super esay 3 ',
      page_carton: carton4(),
    ),
  ];
  @override


  int score = 0;
  @override
  void initState() {
    super.initState();
    loadScore();
  }

  Future<void> loadScore() async {
    final s = await ScoreManager.getScore();
    setState(() {
      score = s;
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
                  builder: (_) => learalpha(),
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



      body: Container(
        color: Color.fromARGB(158, 243, 149, 33),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => buildCard(item: items[index]),
        ),
      ),
    );
  }

  Widget buildCard({
    required Card_carton item,
  }) =>
      Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 200,
          height: 230,
          child: InkWell(
            child: Ink.image(
                image: AssetImage(
              item.urlImage,
            )),
            onTap: () async {
              AudioPlayer player = AudioPlayer();
              Source path = AssetSource('watch_carton_ar.mp3');
              await player.play(path);

              var duration = const Duration(milliseconds: 3000);
              sleep(duration);

              Source path1 = AssetSource('watch_carton.mp3');
              await player.play(path1);

              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => item.page_carton,
                ),
              );
            },
          ),
        ),
      );
}
