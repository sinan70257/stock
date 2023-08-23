import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stocks/api/fetch_data.dart';
import 'package:stocks/model/stock/best_match.dart';
import 'package:stocks/view/home_screen/widgets/searchbar.dart';
import 'package:stocks/view/home_screen/widgets/stock_list.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

TextEditingController searchController = TextEditingController();

class _homeScreenState extends State<homeScreen> {
  List<StockListResult> stocklist = [];
  final FetchStockApi stockApi = FetchStockApi();
  void searchstock(String keywords) async {
    final results = await stockApi.searchStock(keywords);
    setState(() {
      stocklist = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            customSearchbar(searchstock),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  log(stocklist.length.toString());
                  return stockList(stocklist[index]);
                },
                itemCount: stocklist.length,
              ),
            ),
          ],
        ));
  }
}
