
import 'package:flutter/material.dart';
import 'package:mobile/models/base.dart';
import 'package:mobile/models/secret/secret.dart';

typedef Widget EntryWidgetFactory(BuildContext context, Entry entry) ;
typedef Widget EntryLoader(Entry entry, EntryWidgetFactory widgetFactory) ;

class Entry extends Base
 {

  String description;
  List<String> tags;
  List<Secret> secrets = [];
  EntryLoader loader;
  Entry([this.loader]);
  Widget load( EntryWidgetFactory widgetFactory) => this.loader(this, widgetFactory);

  //Future<List<Entry>> get children => this.backend.getChildren(this);
  //Future<List<Secret>> get secrets => this.backend.getSecrets(this);
  //Future<void> save() async => this.backend.saveCollection(this);
  //Future<void> delete() async => this.backend.deleteCollection(this);
}