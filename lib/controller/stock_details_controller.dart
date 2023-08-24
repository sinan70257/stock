import 'package:get/get.dart';
import 'package:stocks/model/stock_details/stock_detail.dart';
import 'package:stocks/services/fetch_data.dart';

class StockDetailsController extends GetxController {
  final FetchStockApi fetchStockApi = FetchStockApi();
  final stockDetails = Rx<StockDetails?>(null);

  Future<void> fetchStockDetails(String symbol) async {
    try {
      final result = await fetchStockApi.fetchStockDetails(symbol);
      stockDetails.value = result;
    } catch (e) {
      print('Error fetching stock details: $e');
    }
  }
}
