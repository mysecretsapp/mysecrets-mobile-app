/* 
// THIS IS FOR DEBUGGING ONLY THIS IS NOT SECURE AND WILL NOT BE AVAILABLE IN PRODUCTION
import 'package:flutter/material.dart';
import 'package:mobile/models/datastore.dart';
import 'package:mobile/models/entry.dart';
import 'package:mobile/models/folder.dart';
import 'package:mobile/util/backends/Backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseDB extends Backend {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  FolderWidgetFactory childWidget;
  final Datastore datastore;
  FirebaseDB(this.childWidget, this.datastore) : super(childWidget, datastore);

  @override
  void initState() {
    super.initState();
    
  } 

  @override
  Widget build(BuildContext context) {
    if(!loading) {
      var folder = new Folder();
      folder.title = "(root)";
      folder.path = "";
      folder.uuid = _user.uid;
      return _FirebaseFolderLoader("/${_user.uid}", folder, this.childWidget);
    } else {
      return Text('Loading');
    }
    
  }
}

class _FirebaseEntryLoader extends StatefulWidget{
  _FirebaseEntryLoader(this.path, this.childFactory);
  final String path;
  final Widget Function(Entry entry) childFactory;
  @override
  _FirebaseEntryLoaderState createState() => _FirebaseEntryLoaderState(path, childFactory);
}

class _FirebaseEntryLoaderState extends State<_FirebaseEntryLoader> {
  final Firestore _db = Firestore.instance;
  
  _FirebaseEntryLoaderState(this.path, this.childFactory);
  final String path;
  final Widget Function(Entry entry) childFactory;
  
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
        title: Text('Needs Work')
      ),
      body: Center(
        child: Text('NEEDS WORK')
      ),
    );
  }
}

class _FirebaseFolderLoader extends StatefulWidget{
  _FirebaseFolderLoader(this.path, this.folder, this.widgetFactory);
  final Folder folder;
  final String path;
  final FolderWidgetFactory widgetFactory;
  @override
  _FirebaseFolderLoaderState createState() => _FirebaseFolderLoaderState(path, folder, widgetFactory);
}

class _FirebaseFolderLoaderState extends State<_FirebaseFolderLoader> {
  final Firestore _db = Firestore.instance;
  
  _FirebaseFolderLoaderState(this.path, this.folder, this.widgetFactory);
  final String path;
  final Folder folder;
  final FolderWidgetFactory widgetFactory;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return StreamBuilder<QuerySnapshot>(
      stream: _db.collection(path).snapshots(),
      builder: (context, folderSnapshot) {
        if (!folderSnapshot.hasData) return LinearProgressIndicator();
        Folder currentFolder = new Folder();
        currentFolder.path = folder.path;
        currentFolder.title = folder.title;
        currentFolder.uuid = folder.uuid;
        folderSnapshot.data.documents.forEach((document){
          switch(document.data['type']){
            case 'folder':
              var child = new Folder((folder, widgetFactory) => _FirebaseFolderLoader("$path/${document.documentID}/children", folder, widgetFactory));
              child.uuid = document.documentID;
              child.path = currentFolder.title == '(root)' ? '' : "${currentFolder.path}/${currentFolder.title}";
              child.title = document.data['title'];
              currentFolder.children.add(child);
              break;
            case 'collection':
              var child = new Entry();
              child.uuid = document.documentID;
              child.title = document.data['title'];
              child.description = document.data['description'];
              currentFolder.children.add(child);
              break;
          }
        });
        return widgetFactory(currentFolder);
      },
    );
  }
}

/*

  @override
  Future<Collection> createCollection(String title, Collection parent) {
    var parentCollection = this.root.where("id", isEqualTo: parent.uuid).reference();
    var newCollectionReference = this.root.document();
    newCollectionReference.setData(data)
    return null;
  }

  @override
  Future<bool> deleteCollection(Collection collection) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<List<Collection>> getChildren(Collection collection) {
    Future<QuerySnapshot> documentsFuture;
    if(collection.uuid != this.root.id){
      documentsFuture = this.root.where("id", isEqualTo: collection.uuid).reference().getDocuments();
    } else {
      documentsFuture = this.root.getDocuments();
    }
    return documentsFuture.then((data) {
      List<Collection> retVal = [];
      data.documents.forEach((document) {
        var collection = new Collection(this);
        var data = document.data;
        collection.title = data['title'];
        collection.uuid = document.documentID;
        collection.description = data['description'];
      });
      return retVal;
    });
  }
  @override
  Future<List<Secret>> getSecrets(Collection collection) {
    return null;
  }

  @override
  Future<bool> saveCollection(Collection collection) {
    // TODO: implement save
    return null;
  }*/*/