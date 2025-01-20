import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_portfolio/presentation/home_screen/home_screen.dart';
import 'package:my_portfolio/presentation/splash_screen/splash_screen.dart';
import 'package:my_portfolio/tst.dart';

import 'constants/const_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NbN',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ConstDetails().prmClr),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
