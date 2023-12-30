// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorModelImpl _$$DoctorModelImplFromJson(Map<String, dynamic> json) =>
    _$DoctorModelImpl(
      name: json['name'] as String,
      contactNumber: json['contactNumber'] as String,
      expertise: json['expertise'] as String,
    );

Map<String, dynamic> _$$DoctorModelImplToJson(_$DoctorModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'expertise': instance.expertise,
    };
