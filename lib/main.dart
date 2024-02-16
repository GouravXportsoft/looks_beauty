import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/authentication/login.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/provider/homeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HomeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: AnimatedSplashScreen(
          backgroundColor: base2Color,
          splashIconSize: size.height,
          splashTransition: SplashTransition.slideTransition,
          splash: const Image(
            image: AssetImage(
              applogoImage,
            ),
          ),
          nextScreen: const LoginPage()),
    );
  }
}
