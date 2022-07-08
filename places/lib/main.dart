import 'package:flutter/material.dart';
import 'package:places/pages/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Places'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: HomeScreen()),
    );
  }
}
