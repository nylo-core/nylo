import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_app/resources/pages/home_page.dart';
import 'package:flutter_app/resources/widgets/theme_toggle_widget.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import 'package:flutter_app/bootstrap/providers.dart';
import 'package:flutter_app/bootstrap/env.g.dart';

void main() {
  // Initialize Nylo testing framework
  // This automatically disables Google Fonts HTTP requests
  NyTest.init();

  // Setup application before running tests
  nySetUpAll(() async {
    NyEnvRegistry.register(getter: Env.get);
    await setupApplication(providers);
  });

  nyGroup('HomePage', () {
    // Use pumpNyWidgetSimple for tests that don't need custom fonts
    // This completely avoids any font-related issues
    nyWidgetTest('displays page header text', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.text('Micro-framework for Flutter'), findsOneWidget);
      expect(find.text('Build something amazing 💡'), findsOneWidget);
    });

    nyWidgetTest('displays documentation link', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.text('Documentation'), findsOneWidget);
      expect(find.text('Master the framework'), findsOneWidget);
    });

    nyWidgetTest('displays github link', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.text('Github'), findsOneWidget);
      expect(find.text('Source code'), findsOneWidget);
    });

    nyWidgetTest('displays updates link', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.text('Updates'), findsOneWidget);
      expect(find.text('View the changelog'), findsOneWidget);
    });

    nyWidgetTest('has floating action button with notification icon', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    nyWidgetTest('has theme toggle widget', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.byType(ThemeToggle), findsOneWidget);
    });

    nyWidgetTest('has logo widget', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.byType(Logo), findsOneWidget);
    });

    // Test that uses the testNyPage helper function
    testNyPage(
      'loads and displays content using testNyPage helper',
      build: () => HomePage(),
      expectations: (tester) async {
        expect(find.text('Micro-framework for Flutter'), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
      },
    );
  });
}
