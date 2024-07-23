import 'package:flutter/material.dart';
import 'package:flutter_circle_grade/view/circle_view.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleView(),
    );
  }
}

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleDegree(
          /*
          When creating an instance of MainCircle,
          it's essential to provide all three parameters: max, min, and value.
          These parameters work together to define the range and current position within that range.
          The max and min parameters establish the upper and lower limits, respectively,
          while the value parameter indicates the current value within this range.
          Omitting any of these parameters may result in unexpected behavior,
          as the class relies on the relationship between max, min, and value to function correctly.
          */
          mainCircle: MainCircle(size: 50, max: 500, min: 100, value: 400),
        ),
      ),
    );
  }
}
