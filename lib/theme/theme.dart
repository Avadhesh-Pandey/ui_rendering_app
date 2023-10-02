
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
      colorScheme: ColorScheme.light(background: Colors.white,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade200,
            inversePrimary: Colors.black87
      ),
  fontFamily: GoogleFonts.notoSans().fontFamily,
  textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
);
ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
        inversePrimary: Colors.white
    ),
  fontFamily: GoogleFonts.notoSans().fontFamily,
  textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
);