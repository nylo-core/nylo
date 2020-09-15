import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nylo_framework/localization/app_localization.dart';

// ignore: must_be_immutable
class AppBuild extends StatelessWidget {
  final String initialRoute;
  Brightness defaultBrightness;
  ThemeData themeData;
  ThemeData darkTheme;
  Locale locale;
  String title;
  bool debugShowCheckedModeBanner;
  bool debugShowMaterialGrid;
  bool showPerformanceOverlay;
  bool checkerboardRasterCacheImages;
  bool checkerboardOffscreenLayers;
  bool showSemanticsDebugger;
  Map<LogicalKeySet, Intent> shortcuts;
  Map<Type, Action<Intent>> actions;
  List<Locale> supportedLocales;
  ThemeMode themeMode;
  Color color;
  GenerateAppTitle onGenerateTitle;
  TransitionBuilder builder;
  List<NavigatorObserver> navigatorObservers;
  RouteFactory onUnknownRoute;
  InitialRouteListFactory onGenerateInitialRoutes;
  GlobalKey<NavigatorState> navigatorKey;

  final Route<dynamic> Function(RouteSettings settings) onGenerateRoute;

  AppBuild({
    Key key,
    this.initialRoute,
    this.title,
    this.defaultBrightness,
    this.locale,
    this.themeData,
    this.onGenerateRoute,
    this.navigatorKey,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.onGenerateTitle,
    this.color,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => themeData,
      themedWidgetBuilder: (context, theme) {
        return ValueListenableBuilder(
          valueListenable: ValueNotifier(locale),
          builder: (context, Locale locale, _) => MaterialApp(
            navigatorKey: navigatorKey,
            themeMode: themeMode,
            onGenerateTitle: onGenerateTitle,
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            onUnknownRoute: onUnknownRoute,
            builder: builder,
            navigatorObservers: navigatorObservers,
            color: color,
            supportedLocales: supportedLocales,
            debugShowMaterialGrid: debugShowMaterialGrid,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            shortcuts: shortcuts,
            actions: actions,
            title: title ?? "",
            darkTheme: darkTheme,
            initialRoute: initialRoute,
            onGenerateRoute: this.onGenerateRoute,
            locale: locale,
            theme: theme,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
            localeResolutionCallback:
                (Locale locale, Iterable<Locale> supportedLocales) {
              return locale;
            },
          ),
        );
      },
    );
  }
}
