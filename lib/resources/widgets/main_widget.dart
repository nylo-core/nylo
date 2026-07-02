import 'package:flutter/material.dart';
import '/config/localization.dart';
import '/resources/widgets/loader_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Main entry point for the application
class Main extends StatefulWidget {
  final String? initialRoute;
  final ThemeMode themeMode;
  final List<NavigatorObserver> navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Route<dynamic>? Function(RouteSettings settings) onGenerateRoute;
  final Route<dynamic>? Function(RouteSettings settings) onUnknownRoute;
  final Nylo? nylo;

  Main(
    Nylo nylo, {
    super.key,
  })  : onGenerateRoute = nylo.router!.generator(),
        onUnknownRoute = nylo.router!.unknownRoute(),
        navigatorKey = NyNavigator.instance.router.navigatorKey,
        initialRoute = nylo.getInitialRoute(),
        navigatorObservers = nylo.getNavigatorObservers(),
        nylo = nylo,
        themeMode = ThemeMode.system;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends NyPage<Main> {
  @override
  get init => () {};

  /// Map of lifecycle actions
  @override
  get lifecycleActions => widget.nylo?.appLifecycleStates ?? <AppLifecycleState, dynamic Function()>{};

  /// Disable dev panel for main app page.
  @override
  bool get useDevPanel => false;

  /// Loading style for the page.
  @override
  LoadingStyle get loadingStyle => LoadingStyle.normal(
        child: MaterialApp(
          color: Colors.white,
          debugShowMaterialGrid: true,
          showPerformanceOverlay: false,
          checkerboardRasterCacheImages: false,
          checkerboardOffscreenLayers: false,
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: true,
          home: Scaffold(backgroundColor: Colors.white, body: Loader()),
        ),
      );

  /// The [view] method displays your page.
  @override
  Widget view(BuildContext context) {
    return NyApp.materialApp(
      navigatorKey: widget.navigatorKey,
      themeMode: widget.themeMode,
      navigatorObservers: widget.navigatorObservers,
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      checkerboardRasterCacheImages: false,
      checkerboardOffscreenLayers: false,
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onUnknownRoute: widget.onUnknownRoute,
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
      supportedLocales: LocalizationConfig.supportedLocales,
    );
  }
}
