
import 'package:flutter/material.dart';
import 'package:mobile/models/base.dart';
import 'package:mobile/models/secret/secret.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Entry extends Base {
  String description;
  List<String> tags = [];
  List<Secret> secrets = [];

  Entry({uuid, title, this.description, this.tags, this.secrets, parentUUID}) : super(uuid: uuid, title: title, parentUUID: parentUUID);
}