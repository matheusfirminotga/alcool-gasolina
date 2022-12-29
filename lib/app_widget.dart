import 'package:alcool_gasolina/views/calculate_consumption.dart';
import 'package:alcool_gasolina/views/home_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
