import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/alphabet/alphabet.dart';

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

class learnalphabet extends StatefulWidget {
  const learnalphabet({super.key});

  @override
  State<learnalphabet> createState() => _learnalphabetState();
}

class _learnalphabetState extends State<learnalphabet> {
  List<CardItem> items = [
    CardItem(
      urlImage: "images_alphabet/a.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 255, 1, 162),
      audio: "A.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/bb.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 59, 228, 7),
      audio: "B.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/cc.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 248, 220, 3),
      audio: "C.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/dd.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 26, 255),
      audio: "D.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ee.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 255, 143, 7),
      audio: "E.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ff.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "F.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/gg.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "G.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/hh.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "H.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ii.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "I.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/jj.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "J.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/kk.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "K.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ll.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "L.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/mm.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "M.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/nn.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "N.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/oo.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "O.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/pp.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "P.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/qq.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "Q.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/rr.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "R.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ss.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "S.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/tt.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "T.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/uu.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "U.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/vv.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "V.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/ww.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "W.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/xx.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "X.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/yy.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "Y.mp3",
    ),
    CardItem(
      urlImage: "images_alphabet/zz.png",
      titel: 'Nike ',
      color1: Color.fromARGB(100, 1, 221, 245),
      audio: "Z.mp3",
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
          itemCount: 26,
          separatorBuilder: (context, _) => SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) => buildCard(item: items[index]),
        ),
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
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
            onTap: () {
              AudioPlayer player = AudioPlayer();
              Source path = AssetSource(item.audio);
              player.play(path);
            },
          ),
        ),
      );
}
