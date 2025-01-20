import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_portfolio/presentation/home_screen/controller/home_controller.dart';

import '../../../constants/const_details.dart';

class HomeWidgets {
  Widget details() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
          child: RichText(
            text: TextSpan(
                text: 'Nabhan ',
                style: TextStyle(
                    color: ConstDetails().prmClr,
                    fontWeight: FontWeight.w900,
                    height: 1.5,
                    fontSize: 50),
                children: [
                  TextSpan(
                      text: 'Usman',
                      style: TextStyle(color: Colors.grey, fontSize: 50))
                ]),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "I'm a ",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  "Flutter Developer.",
                  speed: Duration(milliseconds: 200),
                  textStyle: TextStyle(
                    color: ConstDetails().prmClr,
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),
                ),
                TypewriterAnimatedText(
                  "Freelancer. ",
                  speed: Duration(milliseconds: 200),
                  textStyle: TextStyle(
                    color: ConstDetails().prmClr,
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget connectOptRow(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            highlightColor: ConstDetails().prmClr,
            hoverColor: Colors.red.withValues(alpha: .2),
            onPressed: () => controller.launchUrls(controller.instagramUrl),
            icon: SvgPicture.asset(
              'Assets/Instagram-Glyph-Black-Logo.wine.svg',
              color: Colors.grey,
              width: 30,
            )),
        IconButton(
            highlightColor: ConstDetails().prmClr,
            hoverColor: Colors.red.withValues(alpha: .2),
            onPressed: () => controller.launchUrls(controller.twitterUrl),
            icon: SvgPicture.asset(
              'Assets/Twitter-Logo.wine.svg',
              color: Colors.grey,
              width: 30,
            )),
        IconButton(
            highlightColor: ConstDetails().prmClr,
            hoverColor: Colors.red.withValues(alpha: .2),
            onPressed: () => controller.launchUrls(controller.linkedinUrl),
            icon: SvgPicture.asset(
              'Assets/LinkedIn-Icon-Black-Logo.wine.svg',
              color: Colors.grey,
              width: 30,
            )),
        IconButton(
            highlightColor: ConstDetails().prmClr,
            hoverColor: Colors.red.withValues(alpha: .2),
            onPressed: () => controller.launchUrls(controller.mailUrl),
            icon: SvgPicture.asset(
              'Assets/Gmail-Logo.wine.svg',
              color: Colors.grey,
              width: 30,
            )),
      ],
    );
  }

  Widget connectOptColumn(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              highlightColor: ConstDetails().prmClr,
              hoverColor: Colors.red.withValues(alpha: .2),
              onPressed: () => controller.launchUrls(controller.instagramUrl),
              icon: SvgPicture.asset(
                'Assets/Instagram-Glyph-Black-Logo.wine.svg',
                color: Colors.grey,
                width: 30,
              )),
          IconButton(
              highlightColor: ConstDetails().prmClr,
              hoverColor: Colors.red.withValues(alpha: .2),
              onPressed: () => controller.launchUrls(controller.twitterUrl),
              icon: SvgPicture.asset(
                'Assets/Twitter-Logo.wine.svg',
                color: Colors.grey,
                width: 30,
              )),
          IconButton(
              highlightColor: ConstDetails().prmClr,
              hoverColor: Colors.red.withValues(alpha: .2),
              onPressed: () => controller.launchUrls(controller.linkedinUrl),
              icon: SvgPicture.asset(
                'Assets/LinkedIn-Icon-Black-Logo.wine.svg',
                color: Colors.grey,
                width: 30,
              )),
          IconButton(
              highlightColor: ConstDetails().prmClr,
              hoverColor: Colors.red.withValues(alpha: .2),
              onPressed: () => controller.launchUrls(controller.mailUrl),
              icon: SvgPicture.asset(
                'Assets/Gmail-Logo.wine.svg',
                color: Colors.grey,
                width: 30,
              )),
        ],
      ),
    );
  }
}
