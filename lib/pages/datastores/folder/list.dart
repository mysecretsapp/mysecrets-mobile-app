import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:mobile/models/base.dart';
import 'package:mobile/models/datastore.dart';
import 'package:mobile/models/entry.dart';
import 'package:mobile/models/folder.dart';
import 'package:mobile/pages/view.dart';
import 'package:mobile/util/backends/Backend.dart';
import 'package:mobile/util/backends/FirebaseDB.dart';
import 'package:mobile/util/backends/Local.dart';

class FolderListPage extends StatefulWidget {
  FolderListPage({Key key, this.backend, this.uuid = "root", this.path = "/"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Backend backend;
  final String uuid;
  final String path;

  @override
  _FolderListPageState createState() => _FolderListPageState(backend, uuid, path);
}

class _FolderListPageState extends State<FolderListPage> {
  _FolderListPageState(this.backend, this.uuid, this.path);
  final Backend backend;
  final String uuid;
  final String path;
  Folder _folder;
  

  Future<void> _addCollection() async {

  }

  

  Widget _buildList(BuildContext context) {
    List<Widget> list = [];
    list.add(ListTile(
      title: Text("$path")
    ));
    list.insertAll(1, _folder.children.map((item) => _buildListItem(context, item)).toList());
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: list,
   );
  }

  Widget _buildListItem(BuildContext context, Base item) {
   return Padding(
     key: ValueKey(item.uuid),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: item is Folder ? Flex(children: [
            Icon(Icons.folder), 
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), 
            child:Text(item.title))
           ], direction: Axis.horizontal)  : Text('${item.title}'),
         onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => item is Folder ? FolderListPage(backend: backend, uuid: item.uuid, path: "$path/${item.title}") : ViewPage(entry: item),
            ),
          ),
       ),
     ),
   );
 }

  @override
  void initState() {
    super.initState();
    backend.init().then((res) {
      backend.fetch<Folder>(uuid).then((entity) {
        setState(() {
          _folder = entity;
        });
      });
    });
    
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return  Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("${backend.datastore.name}"),
      ),
      body: _folder == null ? LinearProgressIndicator() :  _buildList(context),
      floatingActionButton: _folder == null ? null : FloatingActionButton(
        onPressed: _addCollection,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
