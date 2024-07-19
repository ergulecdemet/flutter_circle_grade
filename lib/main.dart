import 'package:circle_degree/view/circle_view.dart';
import 'package:flutter/material.dart';
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
      return const MaterialApp(
        title: 'Flutter Demo',
        home: CircleView(
          min: 0,
          max: 100,
          value: 50,
          colors: [Colors.grey, Colors.green, Colors.blue],
        ),
      );
    });
  }
}
