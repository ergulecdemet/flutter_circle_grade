import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppColors get appColors => AppColors.instance!;

class AppColors {
  static AppColors? _instance;
  static AppColors? get instance {
    _instance ??= AppColors._init();
    return _instance;
  }

  final Brightness brightnessLight = Brightness.light;
  AppColors._init();

  final SystemUiOverlayStyle systemUiOverlayLight = SystemUiOverlayStyle.light;
  final Color whiteColor = const Color(0xFFFFFFFF);
  final Color blackColor = const Color(0xFF353535);
  final Color redColor = const Color(0xFFd11919);
  final Color orangeColor = const Color(0xFFffba08);
  final Color blueColor = const Color(0xFF448AFF);
  final Color greenColor = const Color(0xFF4CAF50);
  final Color backgroundColor = const Color(0xFFF6F6F6);
  //0xFFE5E5E5

  final MaterialColor primaryColor =
      const MaterialColor(0xFF18CDAB, <int, Color>{
    50: Color(0xFFE0F7F4), // Çok açık ton
    100: Color(0xFFB3ECE1), // Daha açık ton
    200: Color(0xFF80E0CC), // Orta açık ton
    300: Color(0xFF4DD3B7), // Ana renk
    400: Color(0xFF26C9A8), // Orta koyu ton
    500: Color(0xFF18CDAB), // Ana renk
    600: Color(0xFF16BBA3), // Koyu ton
    700: Color(0xFF12A398), // Daha koyu ton
    800: Color(0xFF0E8A8A), // Koyu ton
    900: Color(0xFF086568), // En koyu ton
  });
  final MaterialColor greyColor = const MaterialColor(0xFF4A4A4A, <int, Color>{
    50: Color(0xFFEDEDED), // Çok açık ton
    100: Color(0xFFD1D1D1), // Daha açık ton
    200: Color(0xFFB5B5B5), // Orta açık ton
    300: Color(0xFF999999), // Ana renkten biraz daha açık
    400: Color(0xFF7E7E7E), // Orta koyu ton
    500: Color(0xFF646464), // Ana renk
    600: Color(0xFF4A4A4A), // Koyu ton
    700: Color(0xFF333333), // Daha koyu ton
    800: Color(0xFF1F1F1F), // Koyu ton
    900: Color(0xFF0A0A0A), // En koyu ton
  });

  final MaterialColor primary2Color = const MaterialColor(
    0xFF0474E6, // #0481FE renginin bir ton koyusu
    <int, Color>{
      50: Color(0xFFE0EAFB), // Çok açık ton
      100: Color(0xFFB3C9F4), // Daha açık ton
      200: Color(0xFF80A6ED), // Orta açık ton
      300: Color(0xFF4D83E5), // Daha az açık ton
      400: Color(0xFF2670E0), // Açık ton
      500: Color(0xFF0474E6), // Ana renk
      600: Color(0xFF0466CF), // Koyu ton
      700: Color(0xFF0357B6), // Daha koyu ton
      800: Color(0xFF03489D), // Daha da koyu ton
      900: Color(0xFF02377E), // En koyu ton
    },
  );
}
