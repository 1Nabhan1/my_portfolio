import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  String instagramUrl = 'https://www.instagram.com/__nabhan_._/';
  String twitterUrl = 'https://twitter.com/@nabustar1';
  String linkedinUrl = 'https://www.linkedin.com/in/nαвнαɴ-uѕмαɴ-ƈʋ-471773283/';
  String mailUrl = 'mailto:nabustar1@gmail.com?subject=Hello&body=How are you?';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void launchUrls(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
