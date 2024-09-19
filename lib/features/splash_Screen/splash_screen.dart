import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeLayout(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        // image: DecorationImage(
        //     image: AssetImage("assets/images/logo.png"),
        //     fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
