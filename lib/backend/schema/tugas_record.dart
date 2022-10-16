import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tugas_record.g.dart';

abstract class TugasRecord implements Built<TugasRecord, TugasRecordBuilder> {
  static Serializer<TugasRecord> get serializer => _$tugasRecordSerializer;

  String? get namaTugas;

  String? get mkTugas;

  String? get ketTugas;

  DateTime? get deadline;

  bool? get isActive;

  int? get indexTugas;

  DocumentReference? get jadwalref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TugasRecordBuilder builder) => builder
    ..namaTugas = ''
    ..mkTugas = ''
    ..ketTugas = ''
    ..isActive = false
    ..indexTugas = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tugas');

  static Stream<TugasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TugasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TugasRecord._();
  factory TugasRecord([void Function(TugasRecordBuilder) updates]) =
      _$TugasRecord;

  static TugasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTugasRecordData({
  String? namaTugas,
  String? mkTugas,
  String? ketTugas,
  DateTime? deadline,
  bool? isActive,
  int? indexTugas,
  DocumentReference? jadwalref,
}) {
  final firestoreData = serializers.toFirestore(
    TugasRecord.serializer,
    TugasRecord(
      (t) => t
        ..namaTugas = namaTugas
        ..mkTugas = mkTugas
        ..ketTugas = ketTugas
        ..deadline = deadline
        ..isActive = isActive
        ..indexTugas = indexTugas
        ..jadwalref = jadwalref,
    ),
  );

  return firestoreData;
}
