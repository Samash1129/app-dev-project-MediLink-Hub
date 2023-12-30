// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicineModel _$MedicineModelFromJson(Map<String, dynamic> json) {
  return _MedicineModel.fromJson(json);
}

/// @nodoc
mixin _$MedicineModel {
  String get name => throw _privateConstructorUsedError;
  String get formula => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicineModelCopyWith<MedicineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineModelCopyWith<$Res> {
  factory $MedicineModelCopyWith(
          MedicineModel value, $Res Function(MedicineModel) then) =
      _$MedicineModelCopyWithImpl<$Res, MedicineModel>;
  @useResult
  $Res call({String name, String formula});
}

/// @nodoc
class _$MedicineModelCopyWithImpl<$Res, $Val extends MedicineModel>
    implements $MedicineModelCopyWith<$Res> {
  _$MedicineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? formula = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formula: null == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicineModelImplCopyWith<$Res>
    implements $MedicineModelCopyWith<$Res> {
  factory _$$MedicineModelImplCopyWith(
          _$MedicineModelImpl value, $Res Function(_$MedicineModelImpl) then) =
      __$$MedicineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String formula});
}

/// @nodoc
class __$$MedicineModelImplCopyWithImpl<$Res>
    extends _$MedicineModelCopyWithImpl<$Res, _$MedicineModelImpl>
    implements _$$MedicineModelImplCopyWith<$Res> {
  __$$MedicineModelImplCopyWithImpl(
      _$MedicineModelImpl _value, $Res Function(_$MedicineModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? formula = null,
  }) {
    return _then(_$MedicineModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formula: null == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicineModelImpl implements _MedicineModel {
  _$MedicineModelImpl({required this.name, required this.formula});

  factory _$MedicineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicineModelImplFromJson(json);

  @override
  final String name;
  @override
  final String formula;

  @override
  String toString() {
    return 'MedicineModel(name: $name, formula: $formula)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formula, formula) || other.formula == formula));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, formula);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineModelImplCopyWith<_$MedicineModelImpl> get copyWith =>
      __$$MedicineModelImplCopyWithImpl<_$MedicineModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicineModelImplToJson(
      this,
    );
  }
}

abstract class _MedicineModel implements MedicineModel {
  factory _MedicineModel(
      {required final String name,
      required final String formula}) = _$MedicineModelImpl;

  factory _MedicineModel.fromJson(Map<String, dynamic> json) =
      _$MedicineModelImpl.fromJson;

  @override
  String get name;
  @override
  String get formula;
  @override
  @JsonKey(ignore: true)
  _$$MedicineModelImplCopyWith<_$MedicineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
