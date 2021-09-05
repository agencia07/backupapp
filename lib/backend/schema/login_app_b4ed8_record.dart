import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'login_app_b4ed8_record.g.dart';

abstract class LoginAppB4ed8Record
    implements Built<LoginAppB4ed8Record, LoginAppB4ed8RecordBuilder> {
  static Serializer<LoginAppB4ed8Record> get serializer =>
      _$loginAppB4ed8RecordSerializer;

  @nullable
  int get campoteste;

  @nullable
  int get email;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LoginAppB4ed8RecordBuilder builder) => builder
    ..campoteste = 0
    ..email = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('login-app-b4ed8');

  static Stream<LoginAppB4ed8Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LoginAppB4ed8Record._();
  factory LoginAppB4ed8Record(
          [void Function(LoginAppB4ed8RecordBuilder) updates]) =
      _$LoginAppB4ed8Record;

  static LoginAppB4ed8Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createLoginAppB4ed8RecordData({
  int campoteste,
  int email,
}) =>
    serializers.toFirestore(
        LoginAppB4ed8Record.serializer,
        LoginAppB4ed8Record((l) => l
          ..campoteste = campoteste
          ..email = email));
