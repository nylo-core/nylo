import 'package:material_ui/material_ui.dart';
import '/resources/widgets/local_asset_widget.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return LocalAsset.image(
      "logo.png",
      height: height ?? 80,
      width: width ?? 80,
    );
  }
}
