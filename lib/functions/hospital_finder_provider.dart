import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for the state of the blood bank finder
final hospitalFinderProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('hospitals').get();

    List<Map<String, dynamic>> hospitalList = [];

    for (final QueryDocumentSnapshot<Map<String, dynamic>> document
        in snapshot.docs) {
      final Map<String, dynamic> data = document.data();

      hospitalList.add({
        'name': data['name'],
        'contactNumber': data['contactNumber'],
        'address': data['address'],
      });
    }

    return hospitalList;
  } catch (e) {
    // You might want to handle errors more gracefully
    throw Exception('Failed to fetch blood banks: $e');
  }
});
