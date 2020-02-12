
import 'package:flutter/material.dart';
import 'package:mobile/models/base.dart';

typedef Widget FolderWidgetFactory( Folder folder) ;
typedef Widget FolderLoader(Folder folder, FolderWidgetFactory widgetFactory) ;
class Folder extends Base {
  String path;
  List<Base> children = [];
  FolderLoader loader;
  Folder([this.loader]);
  Widget load( FolderWidgetFactory widgetFactory) => this.loader(this, widgetFactory);
}