import 'package:flutter/material.dart';
import 'package:flutter_app/config/theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

// ignore: must_be_immutable
class AppBuild extends StatelessWidget {
  String? initialRoute;
  ThemeData? themeData;
  ThemeData? darkTheme;
  ThemeData? lightTheme;
  Locale? locale;
  String? title;
  bool debugShowCheckedModeBanner;
  bool debugShowMaterialGrid;
  bool showPerformanceOverlay;
  bool checkerboardRasterCacheImages;
  bool checkerboardOffscreenLayers;
  bool showSemanticsDebugger;
  Map<LogicalKeySet, Intent>? shortcuts;
  Map<Type, Action<Intent>>? actions;
  List<Locale>? supportedLocales;
  ThemeMode themeMode;
  Color? color;
  GenerateAppTitle? onGenerateTitle;
  TransitionBuilder? builder;
  List<NavigatorObserver> navigatorObservers;
  RouteFactory? onUnknownRoute;
  InitialRouteListFactory? onGenerateInitialRoutes;
  GlobalKey<NavigatorState>? navigatorKey;
  Route<dynamic>? Function(RouteSettings settings) onGenerateRoute;

  AppBuild({
    Key? key,
    this.initialRoute,
    this.title,
    this.locale,
    this.themeData,
    required this.onGenerateRoute,
    this.navigatorKey,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.onGenerateTitle,
    this.color,
    this.lightTheme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.supportedLocales,
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
    return LocalizedApp(
      child: ThemeProvider(
        themes: appThemes
            .map((appTheme) => appTheme.toAppTheme(
                defaultTheme: appTheme.theme.brightness == Brightness.light
                    ? lightTheme
                    : darkTheme))
            .toList(),
        child: ThemeConsumer(
          child: ValueListenableBuilder(
            valueListenable:
                ValueNotifier(locale ?? NyLocalization.instance.locale),
            builder: (context, Locale locale, _) => MaterialApp(
              navigatorKey: navigatorKey,
              themeMode: themeMode,
              onGenerateTitle: onGenerateTitle,
              onGenerateInitialRoutes: onGenerateInitialRoutes,
              onUnknownRoute: onUnknownRoute,
              builder: builder,
              navigatorObservers: navigatorObservers,
              color: color,
              debugShowMaterialGrid: debugShowMaterialGrid,
              showPerformanceOverlay: showPerformanceOverlay,
              checkerboardRasterCacheImages: checkerboardRasterCacheImages,
              checkerboardOffscreenLayers: checkerboardOffscreenLayers,
              showSemanticsDebugger: showSemanticsDebugger,
              debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              shortcuts: shortcuts,
              actions: actions,
              title: title ?? "",
              darkTheme: darkTheme ?? ThemeConfig.dark().theme,
              initialRoute: initialRoute,
              onGenerateRoute: onGenerateRoute,
              theme: themeData ?? ThemeProvider.themeOf(context).data,
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) {
                return locale;
              },
              localizationsDelegates: NyLocalization.instance.delegates,
              locale: locale,
              supportedLocales:
                  supportedLocales ?? NyLocalization.instance.locals(),
            ),
          ),
        ),
      ),
    );
  }
}
