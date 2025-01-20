import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/presentation/menu_screen/model/data.dart';
import 'package:my_portfolio/presentation/menu_screen/widgets/menu_widgets.dart';

import 'controller/menu_controller.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenusController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              right: 30,
              top: 30,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 40,
                ),
                color: Colors.grey,
                onPressed: () => Get.back(),
              )),
          // Animated background text
          MenuWidgets().backGroundText(),
          // Menu items
          MenuWidgets().menuList(controller),
        ],
      ),
    );
  }
}
