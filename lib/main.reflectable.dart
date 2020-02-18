// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:dart_json_mapper/src/model/annotations.dart' as prefix0;
import 'package:mobile/models/base.dart' as prefix3;
import 'package:mobile/models/entry.dart' as prefix2;
import 'package:mobile/models/folder.dart' as prefix1;
import 'package:mobile/models/secret/secret.dart' as prefix4;
import 'package:mobile/util/backends/Backend.dart' as prefix5;

// ignore_for_file: unnecessary_const
// ignore_for_file: prefer_collection_literals
// ignore_for_file: prefer_adjacent_string_concatenation

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.JsonSerializable(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'Folder',
            r'.Folder',
            7,
            0,
            const prefix0.JsonSerializable(),
            const <int>[0, 14],
            const <int>[15, 16, 17, 18, 19, 20, 21, 22, 23, 12, 13],
            const <int>[],
            2,
            {},
            {},
            {
              r'': (b) => ({uuid, title, children}) => b
                  ? prefix1.Folder(children: children, title: title, uuid: uuid)
                  : null
            },
            -1,
            0,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'Entry',
            r'.Entry',
            7,
            1,
            const prefix0.JsonSerializable(),
            const <int>[3, 4, 5, 30],
            const <int>[
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29
            ],
            const <int>[],
            2,
            {},
            {},
            {
              r'': (b) => ({uuid, title, description, tags, secrets}) => b
                  ? prefix2.Entry(
                      description: description,
                      secrets: secrets,
                      tags: tags,
                      title: title,
                      uuid: uuid)
                  : null
            },
            -1,
            1,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'Base',
            r'.Base',
            7,
            2,
            const prefix0.JsonSerializable(),
            const <int>[1, 2, 31],
            const <int>[15, 16, 17, 18, 19, 20, 21, 22, 23],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (b) => ({uuid, title}) =>
                  b ? prefix3.Base(title: title, uuid: uuid) : null
            },
            -1,
            2,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'Secret',
            r'.Secret',
            7,
            3,
            const prefix0.JsonSerializable(),
            const <int>[6, 7, 8, 9, 10, 11, 44],
            const <int>[
              15,
              16,
              17,
              18,
              19,
              32,
              33,
              34,
              35,
              36,
              37,
              38,
              39,
              40,
              41,
              42,
              43
            ],
            const <int>[],
            -1,
            {},
            {},
            {r'': (b) => () => b ? prefix4.Secret() : null},
            -1,
            3,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(
            r'children',
            2129925,
            0,
            const prefix0.JsonSerializable(),
            -1,
            4,
            5,
            const <int>[2],
            const []),
        r.VariableMirrorImpl(
            r'uuid',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'title',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'description',
            32773,
            1,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'tags',
            2129925,
            1,
            const prefix0.JsonSerializable(),
            -1,
            7,
            8,
            const <int>[6],
            const []),
        r.VariableMirrorImpl(
            r'secrets',
            2129925,
            1,
            const prefix0.JsonSerializable(),
            -1,
            9,
            10,
            const <int>[3],
            const []),
        r.VariableMirrorImpl(
            r'uuid',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'sequence',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            11,
            11, const <int>[], const []),
        r.VariableMirrorImpl(
            r'data',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'created',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            12,
            12, const <int>[], const []),
        r.VariableMirrorImpl(
            r'expires',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            12,
            12, const <int>[], const []),
        r.VariableMirrorImpl(
            r'backend',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            13,
            13, const <int>[], const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 0, 12),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 0, 13),
        r.MethodMirrorImpl(r'', 0, 0, -1, 0, 0, const <int>[],
            const <int>[0, 1, 2], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'==', 131074, null, -1, 14, 14, const <int>[],
            const <int>[4], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'toString', 131074, null, -1, 6, 6, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            65538,
            null,
            null,
            null,
            null,
            const <int>[],
            const <int>[5],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 11, 11, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'runtimeType',
            131075,
            null,
            -1,
            15,
            15,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 1, 20),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 1, 21),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 2, 22),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 2, 23),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 3, 24),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 3, 25),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 4, 26),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 4, 27),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 5, 28),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 5, 29),
        r.MethodMirrorImpl(
            r'',
            0,
            1,
            -1,
            1,
            1,
            const <int>[],
            const <int>[8, 9, 10, 11, 12],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'', 0, 2, -1, 2, 2, const <int>[],
            const <int>[16, 17], const prefix0.JsonSerializable(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 6, 32),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 6, 33),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 7, 34),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 7, 35),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 8, 36),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 8, 37),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 9, 38),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 9, 39),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 10, 40),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 10, 41),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 11, 42),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 11, 43),
        r.MethodMirrorImpl(r'', 64, 3, -1, 3, 3, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'uuid',
            28678,
            14,
            const prefix0.JsonSerializable(),
            null,
            null,
            null,
            const <int>[],
            const [],
            null,
            #uuid),
        r.ParameterMirrorImpl(
            r'title',
            28678,
            14,
            const prefix0.JsonSerializable(),
            null,
            null,
            null,
            const <int>[],
            const [],
            null,
            #title),
        r.ParameterMirrorImpl(
            r'children',
            2142214,
            14,
            const prefix0.JsonSerializable(),
            -1,
            4,
            5,
            const <int>[2],
            const [],
            null,
            #children),
        r.ParameterMirrorImpl(
            r'_children',
            2130022,
            13,
            const prefix0.JsonSerializable(),
            -1,
            4,
            5,
            const <int>[2],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            16390,
            15,
            const prefix0.JsonSerializable(),
            null,
            null,
            null,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            32774,
            17,
            const prefix0.JsonSerializable(),
            -1,
            16,
            16,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_uuid',
            32870,
            21,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_title',
            32870,
            23,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'uuid',
            28678,
            30,
            const prefix0.JsonSerializable(),
            null,
            null,
            null,
            const <int>[],
            const [],
            null,
            #uuid),
        r.ParameterMirrorImpl(
            r'title',
            28678,
            30,
            const prefix0.JsonSerializable(),
            null,
            null,
            null,
            const <int>[],
            const [],
            null,
            #title),
        r.ParameterMirrorImpl(
            r'description',
            45062,
            30,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            #description),
        r.ParameterMirrorImpl(
            r'tags',
            2142214,
            30,
            const prefix0.JsonSerializable(),
            -1,
            7,
            8,
            const <int>[6],
            const [],
            null,
            #tags),
        r.ParameterMirrorImpl(
            r'secrets',
            2142214,
            30,
            const prefix0.JsonSerializable(),
            -1,
            9,
            10,
            const <int>[3],
            const [],
            null,
            #secrets),
        r.ParameterMirrorImpl(
            r'_description',
            32870,
            25,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_tags',
            2130022,
            27,
            const prefix0.JsonSerializable(),
            -1,
            7,
            8,
            const <int>[6],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_secrets',
            2130022,
            29,
            const prefix0.JsonSerializable(),
            -1,
            9,
            10,
            const <int>[3],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'uuid',
            45062,
            31,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            #uuid),
        r.ParameterMirrorImpl(
            r'title',
            45062,
            31,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            #title),
        r.ParameterMirrorImpl(
            r'_uuid',
            32870,
            33,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_sequence',
            32870,
            35,
            const prefix0.JsonSerializable(),
            -1,
            11,
            11,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_data',
            32870,
            37,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_created',
            32870,
            39,
            const prefix0.JsonSerializable(),
            -1,
            12,
            12,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_expires',
            32870,
            41,
            const prefix0.JsonSerializable(),
            -1,
            12,
            12,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_backend',
            32870,
            43,
            const prefix0.JsonSerializable(),
            -1,
            13,
            13,
            const <int>[],
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.Folder,
        prefix2.Entry,
        prefix3.Base,
        prefix4.Secret,
        const m.TypeValue<List<prefix3.Base>>().type,
        List,
        String,
        const m.TypeValue<List<String>>().type,
        List,
        const m.TypeValue<List<prefix4.Secret>>().type,
        List,
        int,
        DateTime,
        prefix5.Backend,
        bool,
        Type,
        Invocation
      ],
      4,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'uuid': (dynamic instance) => instance.uuid,
        r'title': (dynamic instance) => instance.title,
        r'children': (dynamic instance) => instance.children,
        r'description': (dynamic instance) => instance.description,
        r'tags': (dynamic instance) => instance.tags,
        r'secrets': (dynamic instance) => instance.secrets,
        r'sequence': (dynamic instance) => instance.sequence,
        r'data': (dynamic instance) => instance.data,
        r'created': (dynamic instance) => instance.created,
        r'expires': (dynamic instance) => instance.expires,
        r'backend': (dynamic instance) => instance.backend
      },
      {
        r'uuid=': (dynamic instance, value) => instance.uuid = value,
        r'title=': (dynamic instance, value) => instance.title = value,
        r'children=': (dynamic instance, value) => instance.children = value,
        r'description=': (dynamic instance, value) =>
            instance.description = value,
        r'tags=': (dynamic instance, value) => instance.tags = value,
        r'secrets=': (dynamic instance, value) => instance.secrets = value,
        r'sequence=': (dynamic instance, value) => instance.sequence = value,
        r'data=': (dynamic instance, value) => instance.data = value,
        r'created=': (dynamic instance, value) => instance.created = value,
        r'expires=': (dynamic instance, value) => instance.expires = value,
        r'backend=': (dynamic instance, value) => instance.backend = value
      },
      null,
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
