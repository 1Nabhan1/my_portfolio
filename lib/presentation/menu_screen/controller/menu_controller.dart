import 'package:flutter/animation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MenusController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String? hoveredText;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  void onHover(String text) {
    hoveredText = text;
    update();
    animationController.forward(from: 0); // Restart animation
  }

  void onExit() {
    hoveredText = null;
    update();
    animationController.reverse();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
