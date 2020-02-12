import 'package:flutter/material.dart';
import 'package:mobile/models/folder.dart';

typedef  Widget BackendChildWidgetFactory(Folder folder);

class BackendWidget extends StatefulWidget {
  final Backend Function() _createState;

  BackendWidget(this._createState, { Key key }) : super(key: key);
  @override
  createState() => this._createState();
}

class Backend extends State<BackendWidget> {
  bool status = false;
  final Folder folder;
  final BackendChildWidgetFactory childWidget;
  Backend(this.childWidget, [this.folder]);
  
  @override
  Widget build(BuildContext context) => Text('Not Used');
}

