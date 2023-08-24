import 'package:get/get.dart';
import 'package:stocks/services/fetch_data.dart';
import 'package:stocks/model/stock/best_match.dart';

class homeComntroller extends GetxController {
  final FetchStockApi stockApi = FetchStockApi();
  var stockList = <StockListResult>[].obs;

  void searchStock(String keywords) async {
    final results = await stockApi.searchStock(keywords);
    stockList.assignAll(results);
  }
}
