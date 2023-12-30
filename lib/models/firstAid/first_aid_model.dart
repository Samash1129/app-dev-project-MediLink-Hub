import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_aid_model.freezed.dart';
part 'first_aid_model.g.dart';

@freezed
abstract class FirstAidModel with _$FirstAidModel {
  factory FirstAidModel({
    required String name,
    required String url,
  }) = _FirstAidModel;

  factory FirstAidModel.fromJson(Map<String, dynamic> json) =>
      _$FirstAidModelFromJson(json);
}
