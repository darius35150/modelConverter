import 'package:flutter/material.dart';
import 'home/home.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: darkBlue,
          useMaterial3: true
          ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: MyWidget(),
        ));
  }
}