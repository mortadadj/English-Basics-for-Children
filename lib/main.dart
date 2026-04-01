import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeux/utils/custom_app_bar.dart';
import 'package:jeux/widget/start.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:webview_flutter/webview_flutter.dart';
//import 'package:audioplayers/audioplayers.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeux/utils/app_styles.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          // 🔥 IMPORTANT
          builder: (context, child) {

            return child!;
          },

          home: MyHomePage(), // ⚠️ PAS const
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  @override
  double _scale = 1.0;


  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return Container(
            color: const Color.fromARGB(158, 243, 149, 33),
            child: Stack(
              children: [
                // Background
                Positioned.fill(
                  child: Image.asset(
                    "images/26.jpg",
                    fit: BoxFit.cover,
                  ),
                ),

                // Centered START button
                Align(
                  alignment: const Alignment(0, 0.8),
                  child: GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        _scale = 0.95;
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        _scale = 1.0;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _scale = 1.0;
                      });
                    },
                    onTap: () async {
                      final player = AudioPlayer();
                      await player.play(AssetSource('startAR.mp3'));
                      await Future.delayed(
                          const Duration(milliseconds: 900));
                      await player.play(AssetSource('start.mp3'));

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const start()),
                      );
                    },
                    child: AnimatedScale(
                      scale: _scale,
                      duration: const Duration(milliseconds: 120),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Wood background
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "images/bois.jpg",
                              width: w * 0.22,
                              height: h * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Text + Icon
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "START",
                                style: AppStyles.buttonText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}