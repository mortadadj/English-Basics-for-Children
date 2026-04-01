import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:jeux/alphabet/alphabet.dart';
import 'package:jeux/colors/colors.dart';
import 'package:jeux/animls/animals.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:jeux/utils/score_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/utils/app_styles.dart';

import '../utils/custom_app_bar.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() =>  _start();
}

class  _start extends State<start> {
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

  }

  Future<void> loadScore() async {
    final s = await ScoreManager.getScore();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),


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
        "image": "images/alphabic.png",
        "title": "ALPHABET",
        "screen": learalpha(),
        "ar": "EnglishAlphabetAR.mp3",
        "en": "EnglishAlphabet.mp3",
      },
      {
        "image": "images/colors.png",
        "title": "COLORS",
        "screen": learacolors(),
        "ar": "colorsAR.mp3",
        "en": "colors.mp3",
      },
      {
        "image": "images/zoo.png",
        "title": "ANIMALS",
        "screen": learalanimls(),
        "ar": "animalsAR.mp3",
        "en": "animals.mp3",
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
