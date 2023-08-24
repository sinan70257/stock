import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/controller/watchlist_controller.dart';

import 'package:stocks/view/watchlist_screen/widgets/stocktile_watchlist.dart';

class WatchList extends StatelessWidget {
  WatchList({super.key});
  final watchListController controller = Get.put(watchListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Watchlist",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Obx(() {
        if (controller.stocksData.isEmpty) {
          return const Center(
            child: Text(
              "No records",
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.stocksData.length,
          itemBuilder: (context, index) {
            final stock = controller.stocksData[index];
            return stockListTile(stock, controller.fetchData);
          },
        );
      }),
    );
  }
}
