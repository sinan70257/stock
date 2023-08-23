import 'package:flutter/material.dart';
import 'package:stocks/view/home_screen/home_screen.dart';
import 'package:stocks/view/watchlist_screen/watchlist_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [const homeScreen(), const watchList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/trade brains.jpg",
          height: 25,
        ),
      ),
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(size: 30),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homw'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Watchlist'),
        ],
      ),
    );
  }
}
