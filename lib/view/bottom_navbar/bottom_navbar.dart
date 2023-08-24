import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/controller/bottomnav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomnavController controller = Get.put(BottomnavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => controller.currentScreen),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.changePage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homw'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'Watchlist'),
            ],
          )),
    );
  }
}
