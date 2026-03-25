import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/colors/color_carton.dart';
import 'package:jeux/colors/learnColors.dart';
import 'package:jeux/colors/testColors.dart';
import 'package:jeux/main.dart';
import 'package:jeux/widget/start.dart';
import 'package:jeux/utils/score_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class learacolors extends StatefulWidget {
  const learacolors({super.key});

  @override
  State<learacolors> createState() => _learacolorsState();
}

class _learacolorsState extends State<learacolors> {
  @override

  final AudioPlayer _player = AudioPlayer();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> playTwoAudios(String ar, String en) async {
    await _player.stop(); // stop previous sound if any

    await _player.play(AssetSource(ar));
    await Future.delayed(const Duration(milliseconds: 900));

    await _player.play(AssetSource(en));
  }

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
          "Colors",
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.white,
            wordSpacing: 1.sp,
            letterSpacing: 0.3.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => start(),
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
              score.toString(),
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
            ),
          )
        ],
      ),


      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          final double spacing = 8;
          final double cardWidth =
              (screenWidth - spacing * 4) / 3;

          return Container(
            color: const Color.fromARGB(158, 243, 149, 33),
            child: Column(
              children: [
                const SizedBox(height: 16), // espace sous header

                SizedBox(
                  height: screenHeight * 0.8 , // hauteur réelle dispo
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: spacing),
                        child: SizedBox(
                          width: cardWidth,
                          child: buildCardFromIndex(context, index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildCardFromIndex(BuildContext context, int index) {
    final items = [
      {
        "image": "images/colors.png",
        "title": "LEARN",
        "screen": learnColors(),
        "ar": "allerAR.mp3",
        "en": "aller.mp3",
      },
      {
        "image": "images/colorsQS.png",
        "title": "QUESTION",
        "screen": testColors(),
        "ar": "reponseAR.mp3",
        "en": "reponse.mp3",
      },
      {
        "image": "images/boton_carton.jpg",
        "title": "CARTON",
        "screen": color_carton(),
        "ar": "watch_carton_ar.mp3",
        "en": "watch_carton.mp3",
      },
    ];


    final item = items[index % items.length];

    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () async {
          await playTwoAudios(
            item["ar"] as String,
            item["en"] as String,
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => item["screen"] as Widget),
          );
        },

        child: Column(
          children: [
            Expanded( // <-- clé anti overflow
              child: ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  item["image"] as String,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 42,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  item["title"] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }



