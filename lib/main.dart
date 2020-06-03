import 'package:bmi_calculator/ResultScrean.dart';
import 'package:flutter/material.dart';

import 'InputScreen.dart';
import 'ResultScrean.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          backgroundColor: Color(0xFF1D2136),
          scaffoldBackgroundColor: Color(0xFF323244)),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultScrean()
      },
    );
  }
}
