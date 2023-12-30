// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BloodBankModel _$BloodBankModelFromJson(Map<String, dynamic> json) {
  return _BloodBankModel.fromJson(json);
}

/// @nodoc
mixin _$BloodBankModel {
  String get name => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<String> get bloodTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BloodBankModelCopyWith<BloodBankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodBankModelCopyWith<$Res> {
  factory $BloodBankModelCopyWith(
          BloodBankModel value, $Res Function(BloodBankModel) then) =
      _$BloodBankModelCopyWithImpl<$Res, BloodBankModel>;
  @useResult
  $Res call(
      {String name,
      String contactNumber,
      String address,
      List<String> bloodTypes});
}

/// @nodoc
class _$BloodBankModelCopyWithImpl<$Res, $Val extends BloodBankModel>
    implements $BloodBankModelCopyWith<$Res> {
  _$BloodBankModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactNumber = null,
    Object? address = null,
    Object? bloodTypes = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bloodTypes: null == bloodTypes
          ? _value.bloodTypes
          : bloodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodBankModelImplCopyWith<$Res>
    implements $BloodBankModelCopyWith<$Res> {
  factory _$$BloodBankModelImplCopyWith(_$BloodBankModelImpl value,
          $Res Function(_$BloodBankModelImpl) then) =
      __$$BloodBankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String contactNumber,
      String address,
      List<String> bloodTypes});
}

/// @nodoc
class __$$BloodBankModelImplCopyWithImpl<$Res>
    extends _$BloodBankModelCopyWithImpl<$Res, _$BloodBankModelImpl>
    implements _$$BloodBankModelImplCopyWith<$Res> {
  __$$BloodBankModelImplCopyWithImpl(
      _$BloodBankModelImpl _value, $Res Function(_$BloodBankModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactNumber = null,
    Object? address = null,
    Object? bloodTypes = null,
  }) {
    return _then(_$BloodBankModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bloodTypes: null == bloodTypes
          ? _value._bloodTypes
          : bloodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodBankModelImpl implements _BloodBankModel {
  _$BloodBankModelImpl(
      {required this.name,
      required this.contactNumber,
      required this.address,
      required final List<String> bloodTypes})
      : _bloodTypes = bloodTypes;

  factory _$BloodBankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodBankModelImplFromJson(json);

  @override
  final String name;
  @override
  final String contactNumber;
  @override
  final String address;
  final List<String> _bloodTypes;
  @override
  List<String> get bloodTypes {
    if (_bloodTypes is EqualUnmodifiableListView) return _bloodTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bloodTypes);
  }

  @override
  String toString() {
    return 'BloodBankModel(name: $name, contactNumber: $contactNumber, address: $address, bloodTypes: $bloodTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodBankModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._bloodTypes, _bloodTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, contactNumber, address,
      const DeepCollectionEquality().hash(_bloodTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodBankModelImplCopyWith<_$BloodBankModelImpl> get copyWith =>
      __$$BloodBankModelImplCopyWithImpl<_$BloodBankModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodBankModelImplToJson(
      this,
    );
  }
}

abstract class _BloodBankModel implements BloodBankModel {
  factory _BloodBankModel(
      {required final String name,
      required final String contactNumber,
      required final String address,
      required final List<String> bloodTypes}) = _$BloodBankModelImpl;

  factory _BloodBankModel.fromJson(Map<String, dynamic> json) =
      _$BloodBankModelImpl.fromJson;

  @override
  String get name;
  @override
  String get contactNumber;
  @override
  String get address;
  @override
  List<String> get bloodTypes;
  @override
  @JsonKey(ignore: true)
  _$$BloodBankModelImplCopyWith<_$BloodBankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
