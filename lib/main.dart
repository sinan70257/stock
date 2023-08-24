import 'package:flutter/material.dart';
import 'package:stocks/db%20%20functions/db_function.dart';
import 'package:stocks/view/bottom_navbar/bottom_navbar.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _myAppState();
}

class _myAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
    );
  }
}
