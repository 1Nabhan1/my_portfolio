import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../controller/menu_controller.dart';
import '../model/data.dart';

class MenuWidgets {
  Widget backGroundText() {
    return Center(
      child: GetBuilder<MenusController>(
        builder: (controller) {
          return AnimatedBuilder(
            animation: controller.animation,
            builder: (context, child) {
              return Opacity(
                opacity: controller.animation.value,
                child: Text(
                  controller.hoveredText ?? '',
                  style: TextStyle(
                    fontSize: 150 * controller.animation.value,
                    color: Colors.grey.withValues(alpha: 0.2),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget menuList(MenusController controller) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Data().menuItems.map((item) {
          return MouseRegion(
            onEnter: (_) => controller.onHover(item),
            onExit: (_) => controller.onExit(),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                print(item);
              },
              child: Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
