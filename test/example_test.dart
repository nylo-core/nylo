import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/bootstrap/providers.dart';
import '/bootstrap/env.g.dart';
import '/resources/pages/home_page.dart';

/// Example tests demonstrating Nylo's testing framework.
///
/// Run tests with: flutter test
/// Run specific file: flutter test test/example_test.dart
///
/// Documentation: https://nylo.dev/docs/7.x/testing
void main() {
  // Initialize Nylo testing framework
  // This automatically:
  // - Sets up test bindings
  // - Mocks platform channels
  // - Disables Google Fonts HTTP requests
  NyTest.init();

  // Setup application before all tests
  nySetUpAll(() async {
    NyEnvRegistry.register(getter: Env.get);
    await setupApplication(providers);
  });

  // ============================================================
  // Widget Tests
  // ============================================================

  nyGroup('Widget Tests', () {
    // Basic widget test using pumpNyWidgetSimple
    // This uses a simple theme without Google Fonts
    nyWidgetTest('can render a NyPage widget', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      // Verify the page renders
      expect(find.byType(Scaffold), findsOneWidget);
    });

    // Test finding text content
    nyWidgetTest('can find text in widget', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.text('Micro-framework for Flutter'), findsOneWidget);
    });

    // Test finding widgets by type
    nyWidgetTest('can find widgets by type', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    // Test interacting with a widget
    nyWidgetTest('can interact with widgets', (tester) async {
      await tester.pumpNyWidgetSimple(HomePage());

      // Verify interactive widgets exist
      final Finder fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      // For buttons that show toasts/dialogs, you may need
      // to use pump() instead of pumpAndSettle() to avoid timer issues
    });
  });

  // ============================================================
  // Using testNyPage helper
  // ============================================================

  nyGroup('testNyPage Helper', () {
    // The testNyPage helper simplifies testing NyPage widgets
    testNyPage(
      'HomePage loads and displays content',
      build: () => HomePage(),
      expectations: (tester) async {
        expect(find.text('Documentation'), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
      },
    );
  });

  // ============================================================
  // Time Travel Tests
  // ============================================================

  nyGroup('Time Travel', () {
    nyTest('can freeze time', () async {
      final frozenDate = DateTime(2025, 6, 15, 10, 30);

      NyTest.travel(frozenDate);

      expect(NyTime.now().year, 2025);
      expect(NyTime.now().month, 6);
      expect(NyTime.now().day, 15);

      NyTest.travelBack();
    });

    nyTest('can travel forward in time', () async {
      NyTest.freezeTime();
      final DateTime now = NyTime.now();

      NyTest.travelForward(const Duration(days: 30));

      expect(NyTime.now().difference(now).inDays, 30);

      NyTest.travelBack();
    });

    nyTest('can travel backward in time', () async {
      NyTest.freezeTime();
      final DateTime now = NyTime.now();

      NyTest.travelBackward(const Duration(hours: 5));

      expect(now.difference(NyTime.now()).inHours, 5);

      NyTest.travelBack();
    });
  });

  // ============================================================
  // API Mocking Tests
  // ============================================================

  nyGroup('API Mocking', () {
    nyTest('can mock API responses', () async {
      // Mock a specific endpoint
      NyMockApi.respond('/users/1', {'id': 1, 'name': 'John Doe'});

      // Verify the mock is registered
      expect(NyMockApi.patternCount, greaterThan(0));
    });

    nyTest('can mock API with wildcards', () async {
      // Single wildcard (*) matches one path segment
      NyMockApi.respond('/users/*', {'id': 1, 'name': 'User'});

      // Double wildcard (**) matches multiple path segments
      NyMockApi.respond('/api/**', {'status': 'ok'});

      expect(NyMockApi.patternCount, greaterThan(0));
    });

    nyTest('can check if API was called', () async {
      NyMockApi.respond('/posts', {'posts': []});

      // Simulate an API call being made
      NyMockApi.recordCall('/posts', method: 'GET');

      expect(NyMockApi.wasCalled('/posts'), isTrue);
      expect(NyMockApi.wasCalled('/posts', method: 'GET'), isTrue);
    });
  });

  // ============================================================
  // Backpack (State Storage) Tests
  // ============================================================

  nyGroup('Backpack State', () {
    nyTest('can seed backpack with test data', () async {
      NyTest.seedBackpack({
        'user_preferences': {'theme': 'dark', 'locale': 'en'},
        'onboarding_complete': true,
      });

      expect(Backpack.instance.read('onboarding_complete'), isTrue);
    });

    nyTest('can use custom assertions for backpack', () async {
      NyTest.seedBackpack({'test_key': 'test_value'});

      expectBackpackContains('test_key');
      expectBackpackContains('test_key', value: 'test_value');
    });
  });

  // ============================================================
  // Authentication Tests
  // ============================================================

  nyGroup('Authentication', () {
    nyTest('can act as authenticated user', () async {
      final Map<String, dynamic> testUser = {'id': 1, 'name': 'Test User', 'email': 'test@example.com'};

      NyTest.actingAs(testUser);

      expect(NyTest.actingUser(), equals(testUser));
    });

    nyTest('can logout user', () async {
      NyTest.actingAs({'id': 1, 'name': 'Test'});
      NyTest.logout();

      expect(NyTest.actingUser(), isNull);
    });
  });

  // ============================================================
  // Test State Management
  // ============================================================

  nyGroup('Test State', () {
    nyTest('can store and retrieve test state', () async {
      NyTest.set('counter', 42);
      NyTest.set('items', ['a', 'b', 'c']);

      expect(NyTest.get<int>('counter'), 42);
      expect(NyTest.get<List>('items'), ['a', 'b', 'c']);
    });
  });

  // ============================================================
  // Route Assertions
  // ============================================================

  nyGroup('Route Assertions', () {
    nyTest('can check if route exists', () async {
      // Check that standard routes are registered
      expectRouteExists('/home');
    });

    nyTest('can check multiple routes exist', () async {
      expectRoutesExist(['/home']);
    });
  });

  // ============================================================
  // Environment Assertions
  // ============================================================

  nyGroup('Environment', () {
    nyTest('can check environment variables', () async {
      expectEnvSet('APP_NAME');
      expectEnvSet('APP_ENV');
    });

    nyTest('is in test mode', () async {
      expectTestMode();
    });
  });
}
