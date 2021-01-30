import 'package:flutter/material.dart';

class SafeAreaContainerWidget extends StatelessWidget {
  final Widget child;
  const SafeAreaContainerWidget({ Key key, this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: child
    );
  }
}
