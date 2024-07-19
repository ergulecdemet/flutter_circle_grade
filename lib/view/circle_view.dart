import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_circle_grade/constants/colors.dart';
import 'package:sizer/sizer.dart';

const int size = 50;

class CircleDegree extends StatefulWidget {
  const CircleDegree(
      {super.key,
      required this.max,
      required this.min,
      required this.value,
      this.colors,
      this.image});
  final double max;
  final double min;
  final double value;
  final List<Color>? colors;
  final String? image;
  @override
  State<CircleDegree> createState() => _CircleDegreeState();
}

class _CircleDegreeState extends State<CircleDegree>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    getDegree();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.sp * 2,
            width: size.sp * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appColors.greyColor[400],
            ),
          ),
          for (int i = 0; i < getDegree(); i++)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double opacity =
                    (_controller.value * 30).clamp(0, i + 1) > i ? 1.0 : 0.0;
                return Opacity(
                  opacity: opacity,
                  child: Transform.translate(
                    offset: Offset(
                      size * cos(2 * pi * i / 20 - pi / 2),
                      size * sin(2 * pi * i / 20 - pi / 2),
                    ),
                    child:
                        SmallCircleWidget(index: i + 1, colors: widget.colors),
                  ),
                );
              },
            ),
          CircleIconDesignWidget(colors: widget.colors, image: widget.image)
        ],
      ),
    );
  }

  int getDegree() {
    double degree =
        ((widget.value - widget.min) * 20) / (widget.max - widget.min);
    return degree.toInt();
  }
}

class SmallCircleWidget extends StatelessWidget {
  const SmallCircleWidget({super.key, this.index, this.colors});

  final int? index;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSizeBox().sp,
      width: getSizeBox().sp,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: colors ??
                  [
                    appColors.primaryColor[600]!,
                    appColors.primaryColor,
                    appColors.primary2Color,
                    appColors.primary2Color[300]!,
                  ])),
    );
  }

  double getSizeBox() {
    double size = 70; // Sabit bir boyut belirleyin
    return (size / 25) + ((size / 25) * (3 * pi * index! / (size / (10 / 8))));
  }
}

class CircleIconDesignWidget extends StatelessWidget {
  const CircleIconDesignWidget({super.key, this.colors, this.image});
  final List<Color>? colors;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.sp + (size / 3),
      width: size.sp + (size / 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: appColors.greyColor[500],
      ),
      child: Container(
          padding: EdgeInsets.all(1.sp),
          margin: EdgeInsets.all(3.sp),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors ??
                    [
                      appColors.primaryColor,
                      appColors.primary2Color,
                      appColors.whiteColor
                    ]),
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appColors.greyColor[500],
                image: DecorationImage(
                    image: AssetImage(image ?? 'assets/icon/default.png'))),
          )),
    );
  }
}
