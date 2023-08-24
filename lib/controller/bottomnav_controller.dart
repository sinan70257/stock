import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/view/home_screen/home_screen.dart';
import 'package:stocks/view/watchlist_screen/watchlist_screen.dart';

class BottomnavController extends GetxController {
  final currentIndex = 0.obs;

  final List<Widget> _screens = [HomeScreen(), WatchList()];

  Widget get currentScreen => _screens[currentIndex.value];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
