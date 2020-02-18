import 'dart:async';
import 'package:mobile/models/datastore.dart';

class Provider {
  Provider._();

  static final Provider db = Provider._();

  Future<List<Datastore>> getAll() async {
    throw(Exception("Not Implemented"));
  }

  Future<Datastore> create(Datastore newDatastore) async {
    throw(Exception("Not Implemented"));
  }
  Future<Datastore> get(dynamic id) async {
    throw(Exception("Not Implemented"));
  }
  Future<bool> save(Datastore newDatastore) async {
    throw(Exception("Not Implemented"));
  }
  Future<bool> delete(dynamic id) async {
    throw(Exception("Not Implemented"));
  }
}