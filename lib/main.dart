import 'package:flutter/material.dart';
import 'package:stocks/db%20%20functions/db_function.dart';
import 'package:stocks/view/bottom_navbar/bottom_navbar.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();

  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
    );
  }
}
