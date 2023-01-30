import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Logo extends StatelessWidget {
  const Logo(
      {Key? key, this.height, this.width})
      : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getImageAsset("nylo_logo.png"),
      height: height ?? 100,
      width: width ?? 100,
    );
  }
}