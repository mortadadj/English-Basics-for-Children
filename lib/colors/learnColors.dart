import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/colors/colors.dart';

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

class learnColors extends StatefulWidget {
  const learnColors({super.key});

  @override
  State<learnColors> createState() => _learnColorsState();
}

class _learnColorsState extends State<learnColors> {
  List<colorsItem> items = [
    colorsItem(
      urlImage: "images_colors/red.png",
      titel: 'Nike ',
      color1: Color.fromARGB(213, 247, 5, 5),
      audio: "red.mp3",
      audio_ar: "red_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/purple.png",
      titel: 'Nike ',
      color1: Color.fromARGB(99, 136, 7, 228),
      audio: "purple.mp3",
      audio_ar: "purple_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/orange.jpg",
      titel: 'Nike ',
      color1: Color.fromARGB(255, 255, 162, 0),
      audio: "orange.mp3",
      audio_ar: "orange_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/yellow.png",
      titel: 'Nike ',
      color1: Color.fromARGB(255, 251, 255, 1),
      audio: "yellow.mp3",
      audio_ar: "yellow_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/green.jpg",
      titel: 'Nike ',
      color1: Color.fromARGB(255, 1, 255, 14),
      audio: "green.mp3",
      audio_ar: "green_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/bleu.jpg",
      titel: 'Nike ',
      color1: Color.fromARGB(248, 11, 7, 255),
      audio: "bleu.mp3",
      audio_ar: "bleu_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/white.jpg",
      titel: 'Nike ',
      color1: Color.fromARGB(255, 254, 253, 253),
      audio: "white.mp3",
      audio_ar: "white_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/pink.jpg",
      titel: 'Nike ',
      color1: Color.fromARGB(252, 233, 1, 245),
      audio: "pink.mp3",
      audio_ar: "pink_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/black.png",
      titel: 'Nike ',
      color1: Color.fromARGB(222, 0, 0, 0),
      audio: "black.mp3",
      audio_ar: "black_ar.mp3",
    ),
    colorsItem(
      urlImage: "images_colors/brown.jpg",
      titel: 'Nike ',
      color1: Color.fromARGB(159, 245, 90, 1),
      audio: "brown.mp3",
      audio_ar: "brown_ar.mp3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              "100",
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => buildCard(item: items[index]),
        ),
      ),
    );
  }

  Widget buildCard({
    required colorsItem item,
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
            splashColor: item.color1,
            onTap: () async {
              AudioPlayer player = AudioPlayer();
              Source path = AssetSource(item.audio);
              await player.play(path);
              var duration = const Duration(milliseconds: 1000);
              sleep(duration);

              Source path1 = AssetSource(item.audio_ar);
              await player.play(path1);
            },
          ),
        ),
      );
}
