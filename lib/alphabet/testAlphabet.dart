import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jeux/utils/score_manager.dart';

import '../utils/app_styles.dart';
import 'alphabet.dart';

class CardItem {
  final String urlImage;
  final String titel;
  final dynamic color1;
  final String audio;
  const CardItem({
    required this.urlImage,
    required this.titel,
    required this.color1,
    required this.audio,
  });
}

class testAlphabet extends StatefulWidget {
  const testAlphabet({super.key});

  @override
  State<testAlphabet> createState() => _testAlphabetState();
}

class _testAlphabetState extends State<testAlphabet> {
  String newtitel = '';
  List<CardItem> items = [
    CardItem(
      urlImage: "images_alphabet/a.png",
      titel: 'A ',
      color1: Color.fromARGB(100, 255, 1, 162),
      audio: "A.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/bb.png",
      titel: 'B ',
      color1: Color.fromARGB(100, 59, 228, 7),
      audio: "B.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/cc.png",
      titel: 'C ',
      color1: Color.fromARGB(100, 248, 220, 3),
      audio: "C.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/dd.png",
      titel: 'D ',
      color1: Color.fromARGB(100, 1, 26, 255),
      audio: "D.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ee.png",
      titel: 'E ',
      color1: Color.fromARGB(100, 255, 143, 7),
      audio: "E.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ff.png",
      titel: 'F ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "F.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/gg.png",
      titel: 'G ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "G.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/hh.png",
      titel: 'H ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "H.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ii.png",
      titel: 'I ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "I.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/jj.png",
      titel: 'J ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "J.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/kk.png",
      titel: 'K ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "K.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ll.png",
      titel: 'L ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "L.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/mm.png",
      titel: 'M ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "M.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/nn.png",
      titel: 'N ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "N.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/oo.png",
      titel: 'O ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "O.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/pp.png",
      titel: 'P ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "P.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/qq.png",
      titel: 'Q ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "Q.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/rr.png",
      titel: 'R ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "R.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ss.png",
      titel: 'S ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "S.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/tt.png",
      titel: 'T ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "T.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/uu.png",
      titel: 'U ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "U.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/vv.png",
      titel: 'V ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "V.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ww.png",
      titel: 'W ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "W.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/xx.png",
      titel: 'X ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "X.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/yy.png",
      titel: 'Y ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "Y.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/zz.png",
      titel: 'Z ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "Z.mp3",
    ),
  ];

  @override
  //Future<void> initState() async {
  //  // TODO: implement initState
  //  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  await prefs.setInt('score', 10);

  //  super.initState();
  //}

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

    List<int> maListe = genererListeAleatoire(4, 0, 25);
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
          backgroundColor: Color.fromARGB(223, 225, 124, 0),
          toolbarHeight: 55.h,
          title: Text(
            "Learn with Stitche",
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
                  builder: (_) =>  learalpha(),
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
    required CardItem item,
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
          await player.play(AssetSource(item.audio));
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
    required CardItem item,
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
              MaterialPageRoute(builder: (_) => testAlphabet()),
            );


          }
        },
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8), // 🔥 espace autour de l’image
          child: Center(
            child: Image.asset(
              item.urlImage,
              fit: BoxFit.contain, // ⭐ clé magique
            ),
          ),
        ),
      ),
    );
  }
}
