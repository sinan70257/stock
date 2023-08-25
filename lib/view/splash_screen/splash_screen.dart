import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:stocks/view/no%20_internet_screen/no_internet_screen.dart';
import 'dart:async';
// import 'package:stocks/view/no_internet_screen/no_internet_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use Future.delayed instead of Timer within build method
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.off(() => InternetConnectionScreen()); // Use Get.off for navigation
      },
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/trade brains.jpg",
          width: 180,
        ),
      ),
    );
  }
}
