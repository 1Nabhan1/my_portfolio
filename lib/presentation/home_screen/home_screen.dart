import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_portfolio/constants/const_details.dart';
import 'package:my_portfolio/presentation/home_screen/controller/home_controller.dart';
import 'package:my_portfolio/presentation/home_screen/widgets/background_moving_cntr.dart';
import 'package:my_portfolio/presentation/home_screen/widgets/home_widgets.dart';

import '../menu_screen/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF161717),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isTab = constraints.maxWidth < 800;
            return Stack(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'Assets/mancrn.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeWidgets().details(),
                  ],
                ),
                Positioned(
                  top: 30,
                  right: 30,
                  child: IconButton(
                      highlightColor: ConstDetails().prmClr,
                      hoverColor: Colors.red.withValues(alpha: .2),
                      onPressed: () => Get.to(() => MenuPage(),
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 500)),
                      icon: SvgPicture.asset(
                        'Assets/menu.svg',
                        color: Colors.grey,
                        width: 30,
                      )),
                ),
                isTab
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: HomeWidgets().connectOptRow(controller))
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: HomeWidgets().connectOptColumn(controller))
              ],
            ).animate().fadeIn(
                  duration: Duration(
                    seconds: 2,
                  ),
                );
          },
        ));
  }
}
