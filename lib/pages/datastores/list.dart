import 'package:flutter/material.dart';
import 'package:mobile/models/datastore.dart';
import 'package:mobile/pages/datastores/create.dart';
import 'package:mobile/pages/datastores/folder/list.dart';
import 'package:mobile/util/DBProviders/Provider.dart';
import 'package:mobile/util/backends/Backend.dart';
import 'package:mobile/util/backends/Local.dart';

class DatastoresListPage extends StatefulWidget {
  DatastoresListPage(this.dsProvider) : super();
  
  
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final Provider dsProvider;
  
  @override
  _DatastoresListPageState createState() => _DatastoresListPageState(this.dsProvider);
}

class _DatastoresListPageState extends State<DatastoresListPage> {
  _DatastoresListPageState(this.dsProvider);
  final Provider dsProvider;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Datastores"),
      ),
      body: FutureBuilder<List<Datastore>>(
        future: this.dsProvider.getAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Datastore>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Datastore datastore = snapshot.data[index];
                return ListTile(
                  key: UniqueKey(),
                  //onDismissed: (direction) {
                  //  this.dsProvider.delete(item.id).then((onValue) => print('Deleted'));
                  //},
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => BackendWidget(() => LocalBackend((folder) => FolderListPage(title: datastore.name, folder: folder), datastore), datastore),
                      builder: (context) {
                        Backend backend;
                        switch(datastore.type){
                          case 'local':
                            backend = LocalBackend(datastore);
                            break;
                        }
                        return FolderListPage(backend: backend);
                      }
                    ),
                  ),
                  title: ListTile(
                    title: Text(datastore.name),
                    leading: Text(datastore.id.toString()),
                    
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DatastoreCreateForm(),
            ),
          ),
        tooltip: 'Add Datastore',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
