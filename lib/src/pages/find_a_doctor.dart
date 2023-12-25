// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Cards.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';

class DoctorFinder extends StatefulWidget {
  const DoctorFinder({Key? key}) : super(key: key);

  @override
  _DoctorFinderState createState() => _DoctorFinderState();
}

class _DoctorFinderState extends State<DoctorFinder> {
  late TextEditingController searchController;
  late List<Map<String, dynamic>> doctors;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    doctors = [];
    fetchDoctors(); // Fetch doctors on initial load
  }

  Future<void> fetchDoctors() async {
    try {
      setState(() {
        isLoading = true;
      });

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

      setState(() {
        doctors = doctorList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error, e.g., show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred while fetching data. $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> searchDoctors(String searchText) async {
    try {
      setState(() {
        isLoading = true;
      });

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('doctors').get();

      List<Map<String, dynamic>> results = [];

      for (final QueryDocumentSnapshot<Map<String, dynamic>> document
          in snapshot.docs) {
        final Map<String, dynamic> data = document.data();

        if (data['name']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            data['expertise']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase())) {
          results.add({
            'name': data['name'],
            'contactNumber': data['contactNumber'],
            'expertise': data['expertise'],
          });
        }
      }

      setState(() {
        doctors = results;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error, e.g., show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred while fetching data. $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back, color: Color(0xFFAF1212)),
                ),
              ),
              const Appbar(appbarHeading: 'Doctor Finder'),
            ],
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8, 8, 8),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          searchDoctors(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(100, 211, 211, 211),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(209, 211, 211, 211),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(100, 211, 211, 211),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: CustomButton(
                      text: 'Search',
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      radius: 5,
                      onPressed: () {
                        // You can implement search functionality here if needed
                        print('Search button pressed');
                      },
                      color: Colors.redAccent[700]!.withOpacity(1.0),
                      width: MediaQuery.of(context).size.width * 0.28,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: doctors.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return const SizedBox(
                              height: 10,
                            );
                          }
                          final Map<String, dynamic> doctor =
                              doctors[index - 1];
                          return CustomCard(
                            elevation: 0,
                            title: 'Dr. ' + doctor['name'],
                            height: 140,
                            description:
                                'Contact Info: ${doctor['contactNumber']}\nExpertise: ${doctor['expertise']}',
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
