import 'dart:async';

import 'package:mobile/models/datastore.dart';
import 'package:mobile/util/DBProviders/Provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDSProvider implements Provider{
  LocalDSProvider._();
  static final LocalDSProvider db = LocalDSProvider._();

  static final createVersions = [
    (Batch batch) => batch.execute("CREATE TABLE Datastores(id INTEGER PRIMARY KEY, name TEXT, type TEXT)"),
    (Batch batch) => batch.execute("CREATE TABLE DatastoreSettings(id TEXT, datastoreId REFERENCES Datastores(id), value, PRIMARY KEY(id, datastoreId))"),
  ];

  static final destroyVersions = [
    (Batch batch) => batch.execute("DROP TABLE Datastores"),
    (Batch batch) => batch.execute("DROP TABLE DatastoreSettings"),
  ];

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    // Open the database and store the reference.
    return await openDatabase(
      // Set the path to the database.

      join(await getDatabasesPath(), 'local_datastores.db'),

      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) async {
        print("Creating DB Version: $version");
        var batch = db.batch();
        for(int batchVersion = 1; batchVersion <= version; batchVersion++ ){
          print("Running batch: $batchVersion");
          createVersions[batchVersion - 1](batch);
        }
        return await batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print("Upgrading from $oldVersion to $newVersion");
        var batch = db.batch();
        for(int batchVersion = oldVersion + 1; batchVersion <= newVersion; batchVersion++ ){
          print("Running batch: $batchVersion");
          createVersions[batchVersion - 1](batch);
        }
        print("Completed DB Upgrade to $newVersion");
        return await batch.commit();
      },
      onDowngrade: (db, oldVersion, newVersion) async {
        print("Downgrading from $oldVersion to $newVersion");
        var batch = db.batch();
        for(int batchVersion = oldVersion; batchVersion > newVersion; batchVersion-- ){
          print("Running batch: $batchVersion");
          destroyVersions[batchVersion - 1](batch);
        }
        print("Completed DB Downgrade to $newVersion");
        return await batch.commit();
      },
      onOpen: (db) {
        print('Opened DB');
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 2,
    );
  }

  Future<List<Datastore>> getAll() async {
    final db = await database;
    var res = await db.query("Datastores");
    List<Datastore> list = res.isNotEmpty ? res.map((c) => Datastore.fromMap(c)).toList() : [];
    return list;
  }
  @override 
  Future<Datastore> create(Datastore newDatastore) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Datastores");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Datastores (id,name,type)"
        " VALUES (?,?,?)",
        [id, newDatastore.name, newDatastore.type]);
    newDatastore.settings.forEach((setting, value) {
      db.rawInsert(
        "INSERT Into DatastoreSettings (id,datastoreId,value)"
        " VALUES (?,?,?)",
        [setting, id, value]);
    });
    return Datastore(id: raw, name: newDatastore.name, type: newDatastore.type, settings: newDatastore.settings);
  }

  @override
  Future<bool> delete(dynamic id) async {
    final db = await database;
    await db.delete('DatastoreSettings', where: "datastoreId = ?" , whereArgs: [id]);
    await db.delete('Datastores', where: "id = ?" , whereArgs: [id]);
    return true;
  }

  @override
  Future<Datastore> get(dynamic id) async {
    final db = await database;
    var res = await db.query("Datastores", where: "id = ?", whereArgs: [id]);
    if(!res.isNotEmpty){
      return null;
    }
    var rawDatastore = res.first;
    var rawSettings = await db.query("DatastoreSettings", where: "datastoreId = ?", whereArgs: [id]);
    rawDatastore['settings'] = Map<String, String>();
    rawSettings.map((Map<String, dynamic> setting) => rawDatastore['settings'][setting['id']] = setting['value']);
    return Datastore.fromMap(rawDatastore);
  }

  @override
  Future<bool> save(Datastore newDatastore) async {
    final db = await database;
    //update settings
    List<Future<int>> transactions = [];
    newDatastore.settings.forEach((setting, value) {
      transactions.add(db.update('DatastoreSettings', {"value": value}, where: 'id = ? AND datastoreId = ?', whereArgs: [setting, newDatastore.id]));
    });
    transactions.add(db.update('Datastores', {"name": newDatastore.name}, where: 'id = ?', whereArgs: [newDatastore.id]));
    await Future.wait(transactions);
    return true;
  }
}