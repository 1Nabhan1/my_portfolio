import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/presentation/home_screen/home_screen.dart';
import 'package:svg_path_parser/svg_path_parser.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> drawingAnimation;
  late Animation<double> fadeInAnimation;
  late Path parsedPath;
  var isPathLoaded = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    drawingAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    // Load the SVG path from file
    _loadSvgPath();
    navigate();
  }

  Future<void> _loadSvgPath() async {
    try {
      final svgString =
          await rootBundle.loadString('Assets/flutterio-icon.svg');

      final pathDataRegExp = RegExp(r'<path[^>]*d="([^"]*)"');
      final match = pathDataRegExp.firstMatch(svgString);

      if (match != null) {
        final pathData = match.group(1)!;
        parsedPath = parseSvgPath(pathData);
        isPathLoaded.value = true;

        // Start the animation once the path is loaded
        animationController.forward();
      } else {
        throw Exception("Path data not found in SVG file");
      }
    } catch (e) {
      print("Error loading SVG path: $e");
    }
  }

  void navigate() {
    Future.delayed(
      Duration(seconds: 8),
      () => Get.to(()=>HomeScreen(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 500)),

    );

  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}


