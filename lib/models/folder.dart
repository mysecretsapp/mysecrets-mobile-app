import 'package:mobile/models/base.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Folder extends Base {
  List<Base> children = <Base>[];
  Folder({uuid, title, parentUUID, this.children}) : super(uuid: uuid, title: title, parentUUID: parentUUID);
}