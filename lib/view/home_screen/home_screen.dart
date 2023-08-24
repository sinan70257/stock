import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/controller/home_controller.dart';
import 'package:stocks/view/home_screen/widgets/searchbar.dart';
import 'package:stocks/view/home_screen/widgets/stock_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeComntroller controller = Get.put(homeComntroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/trade brains.jpg",
          height: 25,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          customSearchbar(controller.searchStock),
          Expanded(
            child: Obx(
              () => controller.stockList.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return stockList(controller.stockList[index]);
                      },
                      itemCount: controller.stockList.length,
                    )
                  : const Center(
                      child: Text("No data found"),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
