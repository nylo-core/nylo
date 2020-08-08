import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Widget loadableBody(
//    {@required Future<void> callable, @required Widget Function() body}) {
//  return FutureBuilder<void>(
//    future: callable,
//    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//      switch (snapshot.connectionState) {
//        case ConnectionState.waiting:
//          return Container(
//            child: new Text(
//              'Loading....',
//              textAlign: TextAlign.center,
//            ),
//            width: double.infinity,
//            padding: EdgeInsets.symmetric(vertical: 50),
//          );
//        default:
//          if (snapshot.hasError)
//            return new Text('Error: ${snapshot.error}',
//                textAlign: TextAlign.center);
//          else
//            return body();
//      }
//    },
//  );
//}

class LoadableBody extends StatelessWidget {
  final Future<dynamic> callable;
  final Widget Function(AsyncSnapshot<void>) body;

  const LoadableBody({Key key, @required this.callable, @required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: callable,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              child: new Text(
                'Loading....',
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 50),
            );
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}',
                  textAlign: TextAlign.center);
            else
              return this.body(snapshot.data);
        }
      },
    );
  }
}
