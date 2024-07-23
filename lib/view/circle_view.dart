import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_circle_grade/constants/colors.dart';

class CircleDegree extends StatefulWidget {
  const CircleDegree({super.key, this.mainCircle});
  final MainCircle? mainCircle;

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
    final double size = widget.mainCircle?.size ??
        70; // Use the size from the mainCircle object

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size * 2.5,
            width: size * 2.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appColors.greyColor[600],
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
                    child: SmallCircleWidget(
                        index: i + 1, mainCircle: widget.mainCircle),
                  ),
                );
              },
            ),
          CircleIconDesignWidget(mainCircle: widget.mainCircle),
        ],
      ),
    );
  }

  int getDegree() {
    double degree =
        (((widget.mainCircle?.value ?? 50) - (widget.mainCircle?.min ?? 0)) *
                20) /
            ((widget.mainCircle?.max ?? 100) - (widget.mainCircle?.min ?? 0));
    return degree.toInt();
  }
}

class SmallCircleWidget extends StatelessWidget {
  const SmallCircleWidget({super.key, this.index, this.mainCircle});

  final int? index;
  final MainCircle? mainCircle;

  @override
  Widget build(BuildContext context) {
    final double size =
        mainCircle?.size ?? 70; // Use the size from the mainCircle object

    return Container(
      height: getSizeBox(size),
      width: getSizeBox(size),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: mainCircle?.colors ??
                  [
                    appColors.primaryColor[600]!,
                    appColors.primaryColor,
                    appColors.primary2Color,
                    appColors.primary2Color[300]!,
                  ])),
    );
  }

  double getSizeBox(double size) {
    return (size / 20) + ((size / 20) * (3 * pi * index! / (size / (10 / 8))));
  }
}

class CircleIconDesignWidget extends StatelessWidget {
  const CircleIconDesignWidget({super.key, this.mainCircle});
  final MainCircle? mainCircle;

  @override
  Widget build(BuildContext context) {
    final double size =
        mainCircle?.size ?? 70; // Use the size from the mainCircle object

    return Container(
      height: size + (size / 3),
      width: size + (size / 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: appColors.greyColor[700],
      ),
      child: Container(
          padding: EdgeInsets.all(1),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: mainCircle?.colors ??
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
                color: appColors.greyColor[700],
              ),
              child: mainCircle?.image != null
                  ? Image.asset(mainCircle?.image ?? "")
                  : Icon(mainCircle?.icon ?? Icons.warning,
                      size: size / 2,
                      color:
                          mainCircle?.iconColor ?? appColors.greyColor[400]))),
    );
  }
}

class MainCircle {
  double? max;
  double? min;
  double? value;
  final List<Color>? colors;
  final String? image;
  final IconData? icon;
  final Color? iconColor;
  final double? size;

  MainCircle(
      {this.max,
      this.min,
      this.value,
      this.colors,
      this.image,
      this.icon,
      this.iconColor,
      this.size});
}
