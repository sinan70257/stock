import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:stocks/model/stock/best_match.dart';

class FetchStockApi {
  static const String apiKey = 'D6NS6GHT165QI8SU';
  static const String baseUrl = "https://www.alphavantage.co";
  int k = 0;
  Future<List<StockListResult>> searchStock(String keywords) async {
    k++;
    log("apicalled $k");
    // final response = await http.get(Uri.parse(
    //     "$baseUrl/query?function=SYMBOL_SEARCH&keywords=$keywords&apikey=$apiKey"));
    final response = await http.get(Uri.parse(
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=tencent&apikey=demo"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["bestMatches"] != null) {
        final stockListData = data["bestMatches"] as List<dynamic>;
        print(stockListData);
        return stockListData.map((e) => StockListResult.fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to load data");
    }
  }
}
