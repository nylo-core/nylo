import 'package:flutter/material.dart';

class AppContainerWidget extends StatefulWidget {
  final Widget child;
  AppContainerWidget({Key key, this.child}) : super(key: key);
  @override
  _AppContainerWidgetState createState() => _AppContainerWidgetState();
}

class _AppContainerWidgetState extends State<AppContainerWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          Color(0xffeeefb),
          Color(0xffdde0e2),
        ]),
      ),
      child: SafeArea(
        child: widget.child
      ),
    );
  }
}