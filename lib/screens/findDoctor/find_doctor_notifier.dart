import 'dart:developer';

import 'package:app_dev_project_medilink_app/models/doctor/doctor_model.dart';
import 'package:app_dev_project_medilink_app/services/doctor_finder_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final doctorProvider = FutureProvider<List<DoctorModel>>((ref) async {
  try {
    final List<DoctorModel> doctorList =
        await FirebaseDoctor.getDoctor();

        log("Doctors: $doctorList");

    return doctorList;
  } catch (e) {
    // You might want to handle errors more gracefully
    throw Exception('Failed to fetch blood banks: $e');
  }
});




