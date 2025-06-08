import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app/calculator_app/screens/calculator_view.dart';
import 'package:flutter_app_demo/app/ice_cream_app/views/ice_cream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(bottom: true, child: IceCreamView()));
  }
}
