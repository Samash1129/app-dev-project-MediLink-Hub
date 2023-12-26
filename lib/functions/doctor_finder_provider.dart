import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for the state of the blood bank finder
final doctorFinderProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();

    List<Map<String, dynamic>> doctorList = [];

    for (final QueryDocumentSnapshot<Map<String, dynamic>> document
        in snapshot.docs) {
      final Map<String, dynamic> data = document.data();

      doctorList.add({
        'name': data['name'],
        'contactNumber': data['contactNumber'],
        'expertise': data['expertise'],
      });
    }

    return doctorList;
  } catch (e) {
    // You might want to handle errors more gracefully
    throw Exception('Failed to fetch blood banks: $e');
  }
});
