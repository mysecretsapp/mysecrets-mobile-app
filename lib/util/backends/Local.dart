import 'dart:async';
import 'dart:typed_data';
import 'package:kdbx/kdbx.dart';
import 'package:kdbx/src/kdbx_group.dart';
import 'package:mobile/models/base.dart';
import 'package:mobile/models/datastore.dart';
import 'package:mobile/models/entry.dart';
import 'package:mobile/models/folder.dart';
import 'package:mobile/util/backends/Backend.dart';
import 'package:biometric_storage/biometric_storage.dart';
import 'dart:convert';
import 'dart:math';
import 'package:dart_json_mapper/dart_json_mapper.dart';



class LocalBackend extends Backend {
  BiometricStorageFile _storage;
  KdbxFile _kdbx;
  LocalBackend(Datastore datastore) : super(datastore);

  Future<BiometricStorageFile> get storage async {
    if (_storage != null) return _storage;
    // if _database is null we instantiate it
    _storage = await BiometricStorage().getStorage(
      'datastore-${datastore.id}',
      options: StorageFileInitOptions(
        authenticationRequired: false,

      ),
    );
    return _storage;
  }

  Future<Credentials> get credentials async {
    var credentialsStorage = await BiometricStorage().getStorage(
      'datastore-${datastore.id}-key',
      options: StorageFileInitOptions(
        authenticationValidityDurationSeconds: 60,
      ),
    );
    var value = await credentialsStorage.read();
    if(value == null){
      value = LocalBackend.createCryptoRandomString();
      credentialsStorage.write(value);
    }
    return Credentials(ProtectedValue.fromString(value));
  }

  Future<KdbxFile> get kdbx async {
    if(_kdbx != null) return _kdbx;
    final credentials = await this.credentials;
    var value = await (await this.storage).read();
    
    //final credentials = Credentials(ProtectedValue.fromString("Blarg"));
    if(value == null){
      final kdbx = KdbxFormat.create(credentials, 'datastore-${datastore.id}');
      final rootGroup = kdbx.body.rootGroup;
       
      await (await this.storage).write(String.fromCharCodes(kdbx.save()));
      value = await (await this.storage).read();
    } 
    Uint8List readVal = Uint8List.fromList(value.codeUnits);
    _kdbx = KdbxFormat.read(readVal, credentials);
    return _kdbx;
  }

  Future<void> _save() async {
    await (await this.storage).write(String.fromCharCodes((await this.kdbx).save()));
  }

  
  @override
  Future<String> create<T extends Base>(T entity) async {
    //get group
    var parent = await this.getFromKDBX(entity.parentUUID) as KdbxGroup;
    String retVal;
    if(entity is Folder){
      var newGroup = KdbxGroup.create(parent: parent, name: entity.title);
      retVal = entity.parentUUID + "/" + newGroup.uuid.toString();
    } else if (entity is Entry){
      var newEntry = KdbxEntry.create((await this.kdbx), parent);
      newEntry.setString(KdbxKey('label'), ProtectedValue.fromString(entity.title));
      //add everything else
      retVal = entity.parentUUID + "/" + newEntry.uuid.toString();
    }
    return retVal;
  }

  @override
  Future<void> delete(String uuid) async {
    var storage = await BiometricStorage().getStorage(
      'datastore-${datastore.id}-$uuid',
      options: StorageFileInitOptions(
        authenticationValidityDurationSeconds: 60,
      ),
    );
    return await storage.delete();
  }

  @override
  Future<T> fetch<T extends Base>(String uuid) async {
    var kdbx = (await this.kdbx);
    var uuidPath = uuid.split("/");
    var currentGroup = await this.getFromKDBX(uuid);
    
    if(currentGroup is KdbxEntry){
      return Entry(uuid: uuid, title: currentGroup.getString(KdbxKey("label"))) as T;
    } else {
      var parentPathParts = uuidPath;
      parentPathParts.removeAt(parentPathParts.length - 1);
      var parentPath = uuid == "root" ? "" : parentPathParts.join('/');
      List<Base> _children = [];
      for(int entryIndex = 0; entryIndex < currentGroup.entries.length; entryIndex++){
        var currentEntry = currentGroup.entries[entryIndex];
        var entry = Entry(uuid: currentEntry.uuid.toString(), title: currentEntry.label, parentUUID: uuid);
        _children.add(entry);
      }
      return Folder(uuid: uuid, title: (currentGroup as KdbxGroup).name.toString(), children: _children, parentUUID:  parentPath) as T;
    }
  }


  @override
  Future<void> update<T extends Base>(T entity) async {
    var storage = await BiometricStorage().getStorage(
      'datastore-${datastore.id}-${entity.uuid}',
      options: StorageFileInitOptions(
        authenticationValidityDurationSeconds: 60,
      ),
    );
    print(JsonMapper.serialize(entity));
    return await storage.write(JsonMapper.serialize(entity));
  }

  @override
  Future<void> init() async {
    
  }

  

  getFromKDBX(String uuid) async {
    var kdbx = (await this.kdbx);
    var uuidPath = uuid.split("/");
    var currentGroup = kdbx.body.rootGroup;
    for(int folderIndex = 1; folderIndex < uuidPath.length; folderIndex++){
      var path = uuidPath[folderIndex];
      var foundGroup;
      for(int groupIndex = 0; groupIndex < currentGroup.groups.length && foundGroup == null; groupIndex++){
        var group = currentGroup.groups[groupIndex];
        if(group.uuid.uuid == path){
          foundGroup = group;
        }
      }
      if(foundGroup == null) {
        KdbxEntry foundEntry;
        for(int entryIndex = 0; entryIndex < currentGroup.entries.length && foundEntry == null; entryIndex++){
          var entry = currentGroup.entries[entryIndex];
          if(entry.uuid.uuid == path){
            foundEntry = entry;
          }
        }
        if(foundEntry != null){
          return foundEntry;
        } else {
          throw Exception("Not Found HALP");
        }
      }
      currentGroup = foundGroup;
    }
    if(currentGroup == null){
      throw Exception("Not Found HALP");
    }
    return currentGroup;
  }

  static String createCryptoRandomString([int length = 1024]) {
    var values = List<int>.generate(length, (i) => Random.secure().nextInt(256));
    return base64Url.encode(values);
  }
}
