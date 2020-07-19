import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/app/interface/home_interface.dart';
import 'package:flutter_app/common/themes/dark_theme.dart';
import 'package:flutter_app/common/themes/default_theme.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  final HomeInterface interface;
  final String title;

  MyHomePage({Key key, this.title, this.interface}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              LottieBuilder.asset(
                "public/assets/lottie/creation.json",
                repeat: false,
                height: 100,
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Nylo",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "v1.0.0",
                        style: Theme.of(context).accentTextTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          child: Text(
                            "Documentation",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.interface.onTapDocumentation,
                        ),
                        MaterialButton(
                          child: Text(
                            "GitHub",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.interface.onTapGithub,
                        ),
                        MaterialButton(
                          child: Text(
                            "ChangeLog",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: widget.interface.onTapChangeLog,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_2,
                    color: Colors.grey,
                  ),
                  Switch(
                      value: _switchValue,
                      onChanged: (val) {
                        _switchValue = val;
                        if (val) {
//                          AppThemeHelper.set(context, theme: defaultTheme());
                        } else {
//                          AppThemeHelper.set(context, theme: darkTheme());
                        }
                      }),
                  Icon(Icons.wb_sunny, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
