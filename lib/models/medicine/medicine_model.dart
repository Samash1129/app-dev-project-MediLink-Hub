import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_model.freezed.dart';
part 'medicine_model.g.dart';

@freezed
abstract class MedicineModel with _$MedicineModel {
  factory MedicineModel({
    required String name,
    required String formula,
  }) = _MedicineModel;

  factory MedicineModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineModelFromJson(json);
}
