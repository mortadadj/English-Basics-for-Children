import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/colors/colors.dart';
import 'package:jeux/utils/score_manager.dart';



class colorsItem {
  final String urlImage;
  final String titel;
  final dynamic color1;
  final String audio;
  final String audio_ar;
  const colorsItem({
    required this.urlImage,
    required this.titel,
    required this.color1,
    required this.audio,
    required this.audio_ar,
  });
}

class testColors extends StatefulWidget {
  const testColors({super.key});

  @override
  State<testColors> createState() => _testColorsState();
}

class _testColorsState extends State<testColors> {
  String newtitel = '';
  List<colorsItem> items = [
    colorsItem(
      urlImage: "images_colors/red.png",
      titel: 'red',
      color1: Color.fromARGB(213, 247, 5, 5),
      audio: "red.mp3",
      audio_ar: "red_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/purple.png",
      titel: 'purple',
      color1: Color.fromARGB(99, 136, 7, 228),
      audio: "purple.mp3",
      audio_ar: "purple_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/orange.jpg",
      titel: 'orange',
      color1: Color.fromARGB(255, 255, 162, 0),
      audio: "orange.mp3",
      audio_ar: "orange_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/yellow.png",
      titel: 'yellow',
      color1: Color.fromARGB(255, 251, 255, 1),
      audio: "yellow.mp3",
      audio_ar: "yellow_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/green.jpg",
      titel: 'green',
      color1: Color.fromARGB(255, 1, 255, 14),
      audio: "green.mp3",
      audio_ar: "green_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/bleu.jpg",
      titel: 'bleu',
      color1: Color.fromARGB(248, 11, 7, 255),
      audio: "bleu.mp3",
      audio_ar: "bleu_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/white.jpg",
      titel: 'white',
      color1: Color.fromARGB(255, 254, 253, 253),
      audio: "white.mp3",
      audio_ar: "white_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/pink.jpg",
      titel: 'pink',
      color1: Color.fromARGB(252, 233, 1, 245),
      audio: "pink.mp3",
      audio_ar: "pink_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/black.png",
      titel: 'black',
      color1: Color.fromARGB(222, 0, 0, 0),
      audio: "black.mp3",
      audio_ar: "black_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/brown.jpg",
      titel: 'brown',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "brown.mp3",
      audio_ar: "brown_ar.mp3",
    ),
  ];

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
  @override
  Widget build(BuildContext context) {
    List<int> genererListeAleatoire(int taille, int min, int max) {
      List<int> listeAleatoire = [];
      Random random = Random();

      while (listeAleatoire.length < taille) {
        int valeurAleatoire = min + random.nextInt(max - min + 1);

        if (!listeAleatoire.contains(valeurAleatoire)) {
          listeAleatoire.add(valeurAleatoire);
        }
      }
      return listeAleatoire;
    }

    List<int> maListe = genererListeAleatoire(4, 0, 9);
    //print("list avant ");
    // print(maListe);
    int ind = Random().nextInt(4);
    int number = maListe[ind];
    maListe.insert(0, number);
    // maListe.add(number);
    //print("number ");
    // print(number);
    // print("list apres ");
    //print(maListe);
    newtitel = items[maListe[0]].titel;
    var scour = 0;

    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Color.fromARGB(223, 225, 124, 0),
          toolbarHeight: 55.h,
          title: Text(
            "Learn with Stitche",
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
                  builder: (_) => learacolors(),
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

      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            // ⭐ empêche l’overflow
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  // carte question
                  Expanded(
                    flex: 4,
                    child: buildCard(item: items[maListe[0]]),
                  ),

                  const SizedBox(width: 10),

                  // cartes réponses
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: buildCard1(item: items[maListe[1]])),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: buildCard1(item: items[maListe[2]])),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: buildCard1(item: items[maListe[3]])),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: buildCard1(item: items[maListe[4]])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }


  Widget buildCard({
    required colorsItem item,
    double? width,
    double? height,
  }) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias, // 🔥 coupe l’image aux coins arrondis
      child: InkWell(
        onTap: () async {
          final player = AudioPlayer();
          await player.play(AssetSource(item.audio ));
          await Future.delayed(const Duration(milliseconds: 900));
          await player.play(AssetSource(item.audio_ar));
        },

        child: SizedBox(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          child: Ink.image(
            image: const AssetImage("images/question_mark.jpg"),
            fit: BoxFit.cover, // 🔥 remplit toute la carte
          ),
        ),
      ),
    );
  }




  Widget buildCard1({
    required colorsItem item,
    double? height,
  }) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias, // 🔥 coupe l’image
      child: InkWell(
        splashColor: item.color1,
        onTap: () async {
          final player = AudioPlayer();

          if (item.titel == newtitel) {

            final newScore = await ScoreManager.addPoint();
            setState(() {
              score = newScore;
            });
            await player.play(AssetSource('game_win.mp3'));
            await Future.delayed(const Duration(milliseconds: 1200));

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => testColors()),
            );
          }
        },
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8), // 🔥 espace autour de l’image
          child: Center(
            child: Image.asset(
              item.urlImage,
              fit: BoxFit.contain,   // ⭐ clé magique
            ),
          ),
        ),
      ),
    );
  }

}
