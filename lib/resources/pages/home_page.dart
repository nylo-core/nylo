import '/config/app.dart';
import '/app/networking/api_service.dart';
import '/resources/widgets/theme_toggle_widget.dart';
import '/bootstrap/extensions.dart';
import '/resources/widgets/logo_widget.dart';
import '/app/controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static RouteView path = ("/home", (_) => HomePage());

  HomePage({super.key}) : super(child: () => _HomePageState());
}

class _HomePageState extends NyPage<HomePage> {
  int? _stars;

  @override
  get init => () async {
    /// Uncomment the code below to fetch the number of stars for the Nylo
    //     Map<String, dynamic>? githubResponse = await api<ApiService>(
    //       (request) => request.githubInfo(),
    //     );
    //
    //     _stars = githubResponse?["stargazers_count"];
  };

  /// Define the Loading style for the page.
  /// Options: LoadingStyle.normal(), LoadingStyle.skeletonizer(), LoadingStyle.none()
  @override
  LoadingStyle get loadingStyle => LoadingStyle.skeletonizer();

  /// Links list
  List<Map<String, dynamic>> _links() {
    return [
      if (Nylo.containsRoute("/landing"))
        {
          "title": "Start building",
          "subtitle": "Your project is ready",
          "icon": FontAwesomeIcons.rocket,
          "onTap": () {
            routeTo("/landing");
          }
        },
      {
        "title": "Documentation",
        "subtitle": "Master the framework",
        "icon": FontAwesomeIcons.readme,
        "onTap": widget.controller.onTapDocumentation
      },
      {
        "title": "Github",
        "subtitle": _stars == null ? "Source code" : "$_stars Stars",
        "icon": FontAwesomeIcons.github,
        "onTap": widget.controller.onTapGithub
      },
      {
        "title": "Updates",
        "subtitle": "View the changelog",
        "icon": FontAwesomeIcons.newspaper,
        "onTap": widget.controller.onTapChangeLog
      },
      {
        "title": "YouTube Channel",
        "subtitle": "Tutorial videos",
        "icon": FontAwesomeIcons.youtube,
        "onTap": widget.controller.onTapYouTube
      },
      {
        "title": "Follow us on X",
        "subtitle": "Stay updated",
        "icon": FontAwesomeIcons.xTwitter,
        "onTap": widget.controller.onTapX
      }
    ];
  }

  /// The [view] method displays your page.
  @override
  Widget view(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          showToastSuccess(
            title: "Hello 👋",
            description: "Welcome to Nylo",
          );

          // Uncomment the code below to send a local notifications
          // await LocalNotification.sendNotification(
          //   title: "Hello 👋",
          //   body: "Welcome to Nylo",
          // );
        },
        child: const Icon(Icons.notifications),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.blue.shade200.setOpacity(0.10),
                    Colors.blue.shade600.setOpacity(0.08),
                    Colors.blue.shade900.setOpacity(0.01),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(),
                  Spacing.vertical(16),
                  Text(
                    AppConfig.appName,
                  ).displayMedium(color: context.color.general.content),
                  const Text("Micro-framework for Flutter",
                          textAlign: TextAlign.center)
                      .titleMedium(color: context.color.general.primaryAccent),
                  const Text("Build something amazing 💡",
                          textAlign: TextAlign.center)
                      .bodyMedium()
                      .alignCenter(),
                  Spacing.vertical(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 250,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: NyColor.resolveColor(context, light: Colors.white, dark: Colors.grey.shade800)!,
                              width: 2,
                            ),
                            color: context.color.general.surface,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withAlpha((255.0 * 0.1).round()),
                                spreadRadius: 1,
                                blurRadius: 9,
                                offset: const Offset(0, 3),
                              ),
                            ],
                        ),
                        child: Center(
                          child: CollectionView.separated(
                            padding: EdgeInsets.zero,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.black12,
                              height: 1,
                            ),
                            data: () {
                              return _links();
                            },
                            builder: (context,
                                CollectionItem<Map<String, dynamic>> item) {
                              Map<String, dynamic> link = item.data;
                              return Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  leading: FaIcon(
                                    link["icon"],
                                    color: NyColor.resolveColor(
                                      context,
                                      light: Colors.grey.shade800,
                                      dark: Colors.grey.shade200,
                                    ),
                                  ),
                                  title: Text(
                                    link["title"] ?? "",
                                  ).bodyLarge(
                                      color: context.color.general.surfaceContent),
                                  subtitle: Text(
                                    link["subtitle"] ?? "",
                                  ).bodySmall(
                                      color: context.color.general.surfaceContent),
                                  trailing: Icon(Icons.chevron_right, color: NyColor.resolveColor(
                                    context,
                                    light: Colors.grey.shade800,
                                    dark: Colors.white,
                                  ),),
                                  onTap: () => link["onTap"](),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      StyledText.template(
                        "Framework Version: {{$nyloVersion}}",
                        style: textTheme.bodyMedium!.copyWith(
                            color: NyColor(
                          light: Colors.grey.shade800,
                          dark: Colors.grey.shade200,
                        ).toColor(context)),
                        styles: {
                          nyloVersion: TextStyle(fontWeight: FontWeight.bold),
                        },
                      ),
                      ThemeToggle(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
