// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_aid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirstAidModel _$FirstAidModelFromJson(Map<String, dynamic> json) {
  return _FirstAidModel.fromJson(json);
}

/// @nodoc
mixin _$FirstAidModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirstAidModelCopyWith<FirstAidModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirstAidModelCopyWith<$Res> {
  factory $FirstAidModelCopyWith(
          FirstAidModel value, $Res Function(FirstAidModel) then) =
      _$FirstAidModelCopyWithImpl<$Res, FirstAidModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$FirstAidModelCopyWithImpl<$Res, $Val extends FirstAidModel>
    implements $FirstAidModelCopyWith<$Res> {
  _$FirstAidModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirstAidModelImplCopyWith<$Res>
    implements $FirstAidModelCopyWith<$Res> {
  factory _$$FirstAidModelImplCopyWith(
          _$FirstAidModelImpl value, $Res Function(_$FirstAidModelImpl) then) =
      __$$FirstAidModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$FirstAidModelImplCopyWithImpl<$Res>
    extends _$FirstAidModelCopyWithImpl<$Res, _$FirstAidModelImpl>
    implements _$$FirstAidModelImplCopyWith<$Res> {
  __$$FirstAidModelImplCopyWithImpl(
      _$FirstAidModelImpl _value, $Res Function(_$FirstAidModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$FirstAidModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirstAidModelImpl implements _FirstAidModel {
  _$FirstAidModelImpl({required this.name, required this.url});

  factory _$FirstAidModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirstAidModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'FirstAidModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstAidModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstAidModelImplCopyWith<_$FirstAidModelImpl> get copyWith =>
      __$$FirstAidModelImplCopyWithImpl<_$FirstAidModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirstAidModelImplToJson(
      this,
    );
  }
}

abstract class _FirstAidModel implements FirstAidModel {
  factory _FirstAidModel(
      {required final String name,
      required final String url}) = _$FirstAidModelImpl;

  factory _FirstAidModel.fromJson(Map<String, dynamic> json) =
      _$FirstAidModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$FirstAidModelImplCopyWith<_$FirstAidModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
