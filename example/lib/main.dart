import 'package:flutter/material.dart';
import 'package:flutter_circle_grade/view/circle_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ExampleView(),
      );
    });
  }
}

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircleDegree(
        max: 100,
        min: 0,
        value: 50,
        colors: [Colors.blueGrey, Colors.blueAccent, Colors.blue],
        image: "assets/icon/default.png",
      ),
    );
  }
}
