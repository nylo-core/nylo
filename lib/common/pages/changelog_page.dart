import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/interface/changelog_interface.dart';
import 'package:flutter_app/app/models/change_log.dart';
import 'package:flutter_app/common/widgets/loadable_body.dart';

class ChangeLogPage extends StatefulWidget {
  final ChangeLogPageInterface interface;
  final String title;

  ChangeLogPage({Key key, this.title, this.interface}) : super(key: key);

  @override
  _ChangeLogPageState createState() => _ChangeLogPageState();
}

class _ChangeLogPageState extends State<ChangeLogPage> {
  ChangeLog changeLog;

  @override
  void initState() {
    super.initState();

    _fetchChangeLogs();
  }

  Future<void> _fetchChangeLogs() async {
    changeLog = await widget.interface.fetchChangeLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: LoadableBody(
//        callable: _fetchChangeLogs(),
//        body: () => SafeArea(
//          child: ListView.builder(
//            itemBuilder: (context, index) {
//              return ListTile(
//                title: Text(
//                  "",
//                  //changeLog.changes[index]
//                  style: Theme.of(context).textTheme.subtitle1,
//                ),
//              );
//            },
//            itemCount: 0,
//          ),
//        ),
//      ),
    );
  }
}
