import 'package:flutter/material.dart';
import 'package:test_flutter/homenavigation.dart';
import 'package:test_flutter/task1.dart';
import 'package:test_flutter/task2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,

          )


        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: homenav()
    );
  }
}

