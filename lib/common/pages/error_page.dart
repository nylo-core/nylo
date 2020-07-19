import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String title;
  final dynamic data;

  ErrorPage({Key key, this.title, this.data});

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            LottieBuilder.asset(
//              "public/assets/lottie/error.json",
//              height: 100,
//            ),
            Text(
              "Oops!\nSomething went wrong",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            InkWell(
              child: Text("Back"),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
