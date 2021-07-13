import 'package:flutter/material.dart';

class SafeAreaWidget extends StatelessWidget {
  final Widget child;
  const SafeAreaWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: child,
    );
  }
}
