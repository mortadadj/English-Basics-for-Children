import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/animls/animals.dart';

import '../utils/app_styles.dart';
import '../utils/score_manager.dart';

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
class learnanimals extends StatefulWidget {
  const learnanimals({Key? key}) : super(key: key);

  @override
  State<learnanimals> createState() => _learnanimalsState();
}



class _learnanimalsState extends State<learnanimals> {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playTwoAudios(String ar, String en) async {
    await _player.stop();
    await _player.play(AssetSource(ar));
    await Future.delayed(const Duration(milliseconds: 900));
    await _player.play(AssetSource(en));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
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


  @override
  Widget build(BuildContext context) {
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
                builder: (_) => learalanimls(),
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
        color: Color.fromARGB(223, 225, 124, 0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => buildCard(item: items[index]),
        ),
      ),
    );
  }

  Widget buildCard({required aimalsItem item}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(25),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: 260,   // largeur de chaque carte
          child: Column(
            children: [
              Expanded(   // 🔥 empêche overflow
                child: InkWell(
                  splashColor: item.color1,
                  onTap: () async {
                    await playTwoAudios(item.audio_ar, item.audio);
                  },
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      item.urlImage,
                      fit: BoxFit.contain,   // 🔥 image bien cadrée
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Text(
                    item.titel,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
