import 'dart:async';

import 'package:mobile/models/base.dart';
import 'package:mobile/models/datastore.dart';

abstract class Backend {
  final Datastore datastore;
  Backend(this.datastore);
  
  Future<String> create<T extends Base>(T entity);
  Future<void> update<T extends Base>(T entity);
  Future<void> delete(String uuid);
  Future<T> fetch<T extends Base>(String uuid);
  Future<void> init();
}