import 'package:get/get.dart';
import 'package:stocks/db%20%20functions/db_function.dart';

class watchListController extends GetxController {
  late Future<void> _databaseInit;
  RxList<Map<String, dynamic>> stocksData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _databaseInit = initDatabase();
    fetchData();
  }

  Future<void> fetchData() async {
    await _databaseInit;
    final data = await getStocksData();
    stocksData.assignAll(data);
  }
}
