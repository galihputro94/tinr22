import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'photo_collection_record.g.dart';

abstract class PhotoCollectionRecord
    implements Built<PhotoCollectionRecord, PhotoCollectionRecordBuilder> {
  static Serializer<PhotoCollectionRecord> get serializer =>
      _$photoCollectionRecordSerializer;

  @BuiltValueField(wireName: 'post_photo')
  String? get postPhoto;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_description')
  String? get postDescription;

  @BuiltValueField(wireName: 'post_user')
  DocumentReference? get postUser;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  BuiltList<DocumentReference>? get likes;

  @BuiltValueField(wireName: 'num_comments')
  int? get numComments;

  @BuiltValueField(wireName: 'num_votes')
  int? get numVotes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PhotoCollectionRecordBuilder builder) =>
      builder
        ..postPhoto = ''
        ..postTitle = ''
        ..postDescription = ''
        ..likes = ListBuilder()
        ..numComments = 0
        ..numVotes = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('photoCollection');

  static Stream<PhotoCollectionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PhotoCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PhotoCollectionRecord._();
  factory PhotoCollectionRecord(
          [void Function(PhotoCollectionRecordBuilder) updates]) =
      _$PhotoCollectionRecord;

  static PhotoCollectionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPhotoCollectionRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
}) {
  final firestoreData = serializers.toFirestore(
    PhotoCollectionRecord.serializer,
    PhotoCollectionRecord(
      (p) => p
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..postUser = postUser
        ..timePosted = timePosted
        ..likes = null
        ..numComments = numComments
        ..numVotes = numVotes,
    ),
  );

  return firestoreData;
}
