import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App Demo",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeView(),
    );
  }
}
