import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/colors/colors.dart';
import 'package:jeux/utils/score_manager.dart';



class aimalsItem {
  final String urlImage;
  final String titel;
  final dynamic color1;
  final String audio;
  final String audio_ar;
  const aimalsItem({
    required this.urlImage,
    required this.titel,
    required this.color1,
    required this.audio,
    required this.audio_ar,
  });
}

class testAnimals extends StatefulWidget {
  const testAnimals({super.key});

  @override
  State<testAnimals> createState() => _testAnimalsState();
}

class _testAnimalsState extends State<testAnimals> {
  String newtitel = '';
  List<aimalsItem> items = [
    ////////////////////// sauvage
    aimalsItem(
      urlImage: "images_animals/lion.jpg",
      titel: 'Lion',
      color1: Color.fromARGB(213, 247, 5, 5),
      audio: "animals/lion.mp3",
      audio_ar: "animals/lion_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/tiger.jpeg",
      titel: 'Tiger',
      color1: Color.fromARGB(99, 136, 7, 228),
      audio: "animals/tiger.mp3",
      audio_ar: "animals/tiger_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/wolf.jpg",
      titel: 'Wolf',
      color1: Color.fromARGB(255, 255, 162, 0),
      audio: "animals/wolf.mp3",
      audio_ar: "animals/wolf_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/crocodile.png",
      titel: 'Crocodile',
      color1: Color.fromARGB(255, 251, 255, 1),
      audio: "animals/crocodile.mp3",
      audio_ar: "animals/crocodile_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/bear.jpg",
      titel: 'Bear',
      color1: Color.fromARGB(255, 1, 255, 14),
      audio: "animals/bear.mp3",
      audio_ar: "animals/bear_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/elephant.jpg",
      titel: 'Elephant',
      color1: Color.fromARGB(248, 11, 7, 255),
      audio: "animals/elephant.mp3",
      audio_ar: "animals/elephant_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/giraffe.jpg",
      titel: 'Giraffe',
      color1: Color.fromARGB(255, 254, 253, 253),
      audio: "animals/giraffe.mp3",
      audio_ar: "animals/giraffe_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/eagle.jpeg",
      titel: 'Eagle',
      color1: Color.fromARGB(252, 233, 1, 245),
      audio: "animals/eagle.mp3",
      audio_ar: "animals/eagle_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/monkey.jpg",
      titel: 'Monkey',
      color1: Color.fromARGB(222, 0, 0, 0),
      audio: "animals/monkey.mp3",
      audio_ar: "animals/monkey_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/snake.jpg",
      titel: 'Snake',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/snake.mp3",
      audio_ar: "animals/snake_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/penguin.jpg",
      titel: 'Penguin',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/penguin.mp3",
      audio_ar: "animals/penguin_ar.mp3",
    ),
    /////////////////////////////////////////////////////////////////

    aimalsItem(
      urlImage: "images_animals/cat.jpeg",
      titel: 'Cat',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/cat.mp3",
      audio_ar: "animals/cat_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/dog.jpg",
      titel: 'Dog',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/dog.mp3",
      audio_ar: "animals/dog_ar.mp3",
    ),

    aimalsItem(
      urlImage: "images_animals/camel.png",
      titel: 'Camel',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/camel.mp3",
      audio_ar: "animals/camel_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/horse.jpg",
      titel: 'Horse',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/horse.mp3",
      audio_ar: "animals/horse_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/donkey.jpg",
      titel: 'Donkey',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/donkey.mp3",
      audio_ar: "animals/donkey_ar.mp3",
    ),

    aimalsItem(
      urlImage: "images_animals/cow.jpg",
      titel: 'Cow',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/cow.mp3",
      audio_ar: "animals/cow_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/goat.jpg",
      titel: 'Goat',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/goat.mp3",
      audio_ar: "animals/goat_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/ram.jpg",
      titel: 'Ram',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/ram.mp3",
      audio_ar: "animals/ram_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/chicken.jpg",
      titel: 'Chicken',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/chicken.mp3",
      audio_ar: "animals/chicken_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/duck.jpeg",
      titel: 'Duck',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/duck.mp3",
      audio_ar: "animals/duck_ar.mp3",
    ),
    aimalsItem(
      urlImage: "images_animals/rabbit.jpg",
      titel: 'Rabbit',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "animals/rabbit.mp3",
      audio_ar: "animals/rabbit_ar.mp3",
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

    List<int> maListe = genererListeAleatoire(4, 0, 21);
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
    required aimalsItem item,
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
    required aimalsItem item,
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
              MaterialPageRoute(builder: (_) => testAnimals()),
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
