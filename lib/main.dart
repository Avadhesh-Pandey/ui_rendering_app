import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ui_rendering_app/core/di/injection_getit.dart' as di;
import 'package:ui_rendering_app/theme/theme.dart';

import 'package:ui_rendering_app/theme/theme_provider.dart';
import 'features/presentation/pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Init Dependency Inject
  await di.init();

  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(360, 640), minTextAdapt: true, splitScreenMode: true);
    return MaterialApp(
      title: 'UI Rendering Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: darkMode,
      home: const HomePage(),
    );
  }
}
