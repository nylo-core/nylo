import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
        return const Center(child: CircularProgressIndicator());
      case TargetPlatform.iOS:
        return const Center(child: CupertinoActivityIndicator());
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
