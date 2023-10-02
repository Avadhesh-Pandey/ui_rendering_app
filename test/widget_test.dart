// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:ui_rendering_app/main.dart';
import 'package:ui_rendering_app/theme/theme_provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    tester.pumpAndSettle();
  });
}


Widget createMaterialWidgetForTesting({Widget? child}) {
  return ChangeNotifierProvider(create: (context) => ThemeProvider(), child: MaterialApp(
    home: Scaffold(
      body: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: (context, widget) => child!,
      ),
    ),
  ));
}