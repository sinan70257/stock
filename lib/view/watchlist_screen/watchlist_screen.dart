import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/controller/watchlist_controller.dart';
import 'package:stocks/view/watchlist_screen/widgets/appbar_watchlist.dart';
import 'package:stocks/view/watchlist_screen/widgets/stocktile_watchlist.dart';

class WatchList extends StatelessWidget {
  WatchList({super.key});
  final watchListController controller = Get.put(watchListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 5),
                        width: 230,
                        child: const Text(
                          'Company',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Text(
                        'Matchscore',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.5),
                  height: 2,
                  color: Colors.grey,
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.stocksData.length,
              itemBuilder: (context, index) {
                final stock = controller.stocksData[index];
                return stockListTile(stock, controller.fetchData);
              },
            ),
          ],
        );
      }),
    );
  }
}
