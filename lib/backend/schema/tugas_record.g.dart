// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tugas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TugasRecord> _$tugasRecordSerializer = new _$TugasRecordSerializer();

class _$TugasRecordSerializer implements StructuredSerializer<TugasRecord> {
  @override
  final Iterable<Type> types = const [TugasRecord, _$TugasRecord];
  @override
  final String wireName = 'TugasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TugasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.namaTugas;
    if (value != null) {
      result
        ..add('namaTugas')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mkTugas;
    if (value != null) {
      result
        ..add('mkTugas')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ketTugas;
    if (value != null) {
      result
        ..add('ketTugas')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deadline;
    if (value != null) {
      result
        ..add('deadline')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isActive;
    if (value != null) {
      result
        ..add('isActive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.indexTugas;
    if (value != null) {
      result
        ..add('indexTugas')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.jadwalref;
    if (value != null) {
      result
        ..add('jadwalref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TugasRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TugasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'namaTugas':
          result.namaTugas = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mkTugas':
          result.mkTugas = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ketTugas':
          result.ketTugas = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deadline':
          result.deadline = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isActive':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'indexTugas':
          result.indexTugas = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'jadwalref':
          result.jadwalref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TugasRecord extends TugasRecord {
  @override
  final String? namaTugas;
  @override
  final String? mkTugas;
  @override
  final String? ketTugas;
  @override
  final DateTime? deadline;
  @override
  final bool? isActive;
  @override
  final int? indexTugas;
  @override
  final DocumentReference<Object?>? jadwalref;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TugasRecord([void Function(TugasRecordBuilder)? updates]) =>
      (new TugasRecordBuilder()..update(updates))._build();

  _$TugasRecord._(
      {this.namaTugas,
      this.mkTugas,
      this.ketTugas,
      this.deadline,
      this.isActive,
      this.indexTugas,
      this.jadwalref,
      this.ffRef})
      : super._();

  @override
  TugasRecord rebuild(void Function(TugasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TugasRecordBuilder toBuilder() => new TugasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TugasRecord &&
        namaTugas == other.namaTugas &&
        mkTugas == other.mkTugas &&
        ketTugas == other.ketTugas &&
        deadline == other.deadline &&
        isActive == other.isActive &&
        indexTugas == other.indexTugas &&
        jadwalref == other.jadwalref &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, namaTugas.hashCode), mkTugas.hashCode),
                            ketTugas.hashCode),
                        deadline.hashCode),
                    isActive.hashCode),
                indexTugas.hashCode),
            jadwalref.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TugasRecord')
          ..add('namaTugas', namaTugas)
          ..add('mkTugas', mkTugas)
          ..add('ketTugas', ketTugas)
          ..add('deadline', deadline)
          ..add('isActive', isActive)
          ..add('indexTugas', indexTugas)
          ..add('jadwalref', jadwalref)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TugasRecordBuilder implements Builder<TugasRecord, TugasRecordBuilder> {
  _$TugasRecord? _$v;

  String? _namaTugas;
  String? get namaTugas => _$this._namaTugas;
  set namaTugas(String? namaTugas) => _$this._namaTugas = namaTugas;

  String? _mkTugas;
  String? get mkTugas => _$this._mkTugas;
  set mkTugas(String? mkTugas) => _$this._mkTugas = mkTugas;

  String? _ketTugas;
  String? get ketTugas => _$this._ketTugas;
  set ketTugas(String? ketTugas) => _$this._ketTugas = ketTugas;

  DateTime? _deadline;
  DateTime? get deadline => _$this._deadline;
  set deadline(DateTime? deadline) => _$this._deadline = deadline;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  int? _indexTugas;
  int? get indexTugas => _$this._indexTugas;
  set indexTugas(int? indexTugas) => _$this._indexTugas = indexTugas;

  DocumentReference<Object?>? _jadwalref;
  DocumentReference<Object?>? get jadwalref => _$this._jadwalref;
  set jadwalref(DocumentReference<Object?>? jadwalref) =>
      _$this._jadwalref = jadwalref;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TugasRecordBuilder() {
    TugasRecord._initializeBuilder(this);
  }

  TugasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaTugas = $v.namaTugas;
      _mkTugas = $v.mkTugas;
      _ketTugas = $v.ketTugas;
      _deadline = $v.deadline;
      _isActive = $v.isActive;
      _indexTugas = $v.indexTugas;
      _jadwalref = $v.jadwalref;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TugasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TugasRecord;
  }

  @override
  void update(void Function(TugasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TugasRecord build() => _build();

  _$TugasRecord _build() {
    final _$result = _$v ??
        new _$TugasRecord._(
            namaTugas: namaTugas,
            mkTugas: mkTugas,
            ketTugas: ketTugas,
            deadline: deadline,
            isActive: isActive,
            indexTugas: indexTugas,
            jadwalref: jadwalref,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
