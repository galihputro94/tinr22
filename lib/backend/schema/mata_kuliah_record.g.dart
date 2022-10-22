// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mata_kuliah_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MataKuliahRecord> _$mataKuliahRecordSerializer =
    new _$MataKuliahRecordSerializer();

class _$MataKuliahRecordSerializer
    implements StructuredSerializer<MataKuliahRecord> {
  @override
  final Iterable<Type> types = const [MataKuliahRecord, _$MataKuliahRecord];
  @override
  final String wireName = 'MataKuliahRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MataKuliahRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.namaMK;
    if (value != null) {
      result
        ..add('namaMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dosenMK;
    if (value != null) {
      result
        ..add('dosenMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ruangMK;
    if (value != null) {
      result
        ..add('ruangMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hariMK;
    if (value != null) {
      result
        ..add('hariMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sksMK;
    if (value != null) {
      result
        ..add('sksMK')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.materiRef;
    if (value != null) {
      result
        ..add('materiRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.jamMK;
    if (value != null) {
      result
        ..add('jamMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.refmat;
    if (value != null) {
      result
        ..add('refmat')
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
  MataKuliahRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MataKuliahRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'namaMK':
          result.namaMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dosenMK':
          result.dosenMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ruangMK':
          result.ruangMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hariMK':
          result.hariMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sksMK':
          result.sksMK = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'materiRef':
          result.materiRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'jamMK':
          result.jamMK = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'refmat':
          result.refmat = serializers.deserialize(value,
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

class _$MataKuliahRecord extends MataKuliahRecord {
  @override
  final String? namaMK;
  @override
  final String? dosenMK;
  @override
  final String? ruangMK;
  @override
  final String? hariMK;
  @override
  final int? sksMK;
  @override
  final BuiltList<DocumentReference<Object?>>? materiRef;
  @override
  final DateTime? jamMK;
  @override
  final DocumentReference<Object?>? refmat;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MataKuliahRecord(
          [void Function(MataKuliahRecordBuilder)? updates]) =>
      (new MataKuliahRecordBuilder()..update(updates))._build();

  _$MataKuliahRecord._(
      {this.namaMK,
      this.dosenMK,
      this.ruangMK,
      this.hariMK,
      this.sksMK,
      this.materiRef,
      this.jamMK,
      this.refmat,
      this.ffRef})
      : super._();

  @override
  MataKuliahRecord rebuild(void Function(MataKuliahRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MataKuliahRecordBuilder toBuilder() =>
      new MataKuliahRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MataKuliahRecord &&
        namaMK == other.namaMK &&
        dosenMK == other.dosenMK &&
        ruangMK == other.ruangMK &&
        hariMK == other.hariMK &&
        sksMK == other.sksMK &&
        materiRef == other.materiRef &&
        jamMK == other.jamMK &&
        refmat == other.refmat &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, namaMK.hashCode), dosenMK.hashCode),
                                ruangMK.hashCode),
                            hariMK.hashCode),
                        sksMK.hashCode),
                    materiRef.hashCode),
                jamMK.hashCode),
            refmat.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MataKuliahRecord')
          ..add('namaMK', namaMK)
          ..add('dosenMK', dosenMK)
          ..add('ruangMK', ruangMK)
          ..add('hariMK', hariMK)
          ..add('sksMK', sksMK)
          ..add('materiRef', materiRef)
          ..add('jamMK', jamMK)
          ..add('refmat', refmat)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MataKuliahRecordBuilder
    implements Builder<MataKuliahRecord, MataKuliahRecordBuilder> {
  _$MataKuliahRecord? _$v;

  String? _namaMK;
  String? get namaMK => _$this._namaMK;
  set namaMK(String? namaMK) => _$this._namaMK = namaMK;

  String? _dosenMK;
  String? get dosenMK => _$this._dosenMK;
  set dosenMK(String? dosenMK) => _$this._dosenMK = dosenMK;

  String? _ruangMK;
  String? get ruangMK => _$this._ruangMK;
  set ruangMK(String? ruangMK) => _$this._ruangMK = ruangMK;

  String? _hariMK;
  String? get hariMK => _$this._hariMK;
  set hariMK(String? hariMK) => _$this._hariMK = hariMK;

  int? _sksMK;
  int? get sksMK => _$this._sksMK;
  set sksMK(int? sksMK) => _$this._sksMK = sksMK;

  ListBuilder<DocumentReference<Object?>>? _materiRef;
  ListBuilder<DocumentReference<Object?>> get materiRef =>
      _$this._materiRef ??= new ListBuilder<DocumentReference<Object?>>();
  set materiRef(ListBuilder<DocumentReference<Object?>>? materiRef) =>
      _$this._materiRef = materiRef;

  DateTime? _jamMK;
  DateTime? get jamMK => _$this._jamMK;
  set jamMK(DateTime? jamMK) => _$this._jamMK = jamMK;

  DocumentReference<Object?>? _refmat;
  DocumentReference<Object?>? get refmat => _$this._refmat;
  set refmat(DocumentReference<Object?>? refmat) => _$this._refmat = refmat;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MataKuliahRecordBuilder() {
    MataKuliahRecord._initializeBuilder(this);
  }

  MataKuliahRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaMK = $v.namaMK;
      _dosenMK = $v.dosenMK;
      _ruangMK = $v.ruangMK;
      _hariMK = $v.hariMK;
      _sksMK = $v.sksMK;
      _materiRef = $v.materiRef?.toBuilder();
      _jamMK = $v.jamMK;
      _refmat = $v.refmat;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MataKuliahRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MataKuliahRecord;
  }

  @override
  void update(void Function(MataKuliahRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MataKuliahRecord build() => _build();

  _$MataKuliahRecord _build() {
    _$MataKuliahRecord _$result;
    try {
      _$result = _$v ??
          new _$MataKuliahRecord._(
              namaMK: namaMK,
              dosenMK: dosenMK,
              ruangMK: ruangMK,
              hariMK: hariMK,
              sksMK: sksMK,
              materiRef: _materiRef?.build(),
              jamMK: jamMK,
              refmat: refmat,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'materiRef';
        _materiRef?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MataKuliahRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
