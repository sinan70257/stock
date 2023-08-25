import 'package:get/get.dart';
import 'package:stocks/db%20%20functions/db_function.dart';

class watchListController extends GetxController {
  RxList<Map<String, dynamic>> stocksData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final data = await getStocksData();
    stocksData.assignAll(data);
  }
}
