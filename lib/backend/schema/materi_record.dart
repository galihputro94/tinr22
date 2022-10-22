import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'materi_record.g.dart';

abstract class MateriRecord
    implements Built<MateriRecord, MateriRecordBuilder> {
  static Serializer<MateriRecord> get serializer => _$materiRecordSerializer;

  String? get nama;

  String? get link;

  String? get mk;

  DateTime? get createdAt;

  DocumentReference? get mataKuliah;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MateriRecordBuilder builder) => builder
    ..nama = ''
    ..link = ''
    ..mk = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('materi');

  static Stream<MateriRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MateriRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MateriRecord._();
  factory MateriRecord([void Function(MateriRecordBuilder) updates]) =
      _$MateriRecord;

  static MateriRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMateriRecordData({
  String? nama,
  String? link,
  String? mk,
  DateTime? createdAt,
  DocumentReference? mataKuliah,
}) {
  final firestoreData = serializers.toFirestore(
    MateriRecord.serializer,
    MateriRecord(
      (m) => m
        ..nama = nama
        ..link = link
        ..mk = mk
        ..createdAt = createdAt
        ..mataKuliah = mataKuliah,
    ),
  );

  return firestoreData;
}
