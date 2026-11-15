import 'package:material_ui/material_ui.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LocalAsset extends StatelessWidget {

  // images
  const LocalAsset.image(String assetName,
      {super.key,
      this.width,
      this.height,
      this.fit,
      this.opacity,
      this.borderRadius})
      : assetName = "images/$assetName";

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? opacity;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget widget = Image.asset(getAsset(assetName),
        height: height, width: width, fit: fit);

    if (opacity != null) {
      widget = Opacity(
        opacity: opacity!,
        child: widget,
      );
    }

    if (borderRadius != null) {
      widget = ClipRRect(
        borderRadius: borderRadius!,
        child: widget,
      );
    }

    return widget;
  }
}
