import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Base{
  String uuid;
  String title;
  String parentUUID;
  Base({this.uuid, this.title, this.parentUUID});

}