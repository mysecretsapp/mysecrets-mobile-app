import 'package:mobile/util/backends/Backend.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Secret {
  //Fields
  String uuid;
  int sequence;
  String data;
  DateTime created;
  DateTime expires;
  Backend backend;
}

