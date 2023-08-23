import 'package:flutter/material.dart';
import 'package:stocks/db%20%20functions/db_function.dart';
import 'package:stocks/view/watchlist_screen/widgets/stocktile_watchlist.dart';

class watchList extends StatefulWidget {
  const watchList({super.key});

  @override
  State<watchList> createState() => _watchListState();
}

class _watchListState extends State<watchList> {
  late Future<void> _databaseInit;
  List<Map<String, dynamic>> _stocksData = [];

  @override
  void initState() {
    super.initState();
    _databaseInit = initDatabase();
    fetchData();
  }

  Future<void> fetchData() async {
    await _databaseInit;
    final stocksData = await getStocksData();
    setState(() {
      _stocksData = stocksData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _databaseInit,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: _stocksData.length,
              itemBuilder: (context, index) {
                final stock = _stocksData[index];
                return stockListTile(stock, fetchData);
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
