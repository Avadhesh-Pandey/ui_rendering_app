import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:ui_rendering_app/core/di/injection_getit.dart' as di;
import 'package:ui_rendering_app/features/presentation/pages/home/home_page.dart';

import '../../../../widget_test.dart';

void main() async {
  await di.init();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Home Page test", (widgetTester) async {
    WidgetsFlutterBinding.ensureInitialized();
    await mockNetworkImages(() async {
      return await widgetTester.pumpWidget(
        createMaterialWidgetForTesting(child: const HomePage()),
      );
    });

    await widgetTester.pumpAndSettle();
    expect(find.byType(Image), findsAtLeastNWidgets(1));
    expect(find.byType(Container), findsAtLeastNWidgets(1));
    expect(find.byType(ColoredBox), findsAtLeastNWidgets(1));
    expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    expect(find.byType(Text), findsAtLeastNWidgets(2));
  });
}
