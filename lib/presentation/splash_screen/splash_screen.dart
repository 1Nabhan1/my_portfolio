import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_portfolio/presentation/splash_screen/widgets/custom_painter.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Obx(() => controller.isPathLoaded.value
                ? AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: SvgPathPainter(
                          path: controller.parsedPath,
                          progress: controller.drawingAnimation.value,
                          fillOpacity: controller.fadeInAnimation.value,
                        ),
                        size: const Size(100, 100),
                      );
                    },
                  )
                : SizedBox())));
  }
}
