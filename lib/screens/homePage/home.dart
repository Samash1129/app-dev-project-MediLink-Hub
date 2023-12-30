import 'package:app_dev_project_medilink_app/widgets/appbar_widget.dart';
import 'package:app_dev_project_medilink_app/widgets/cards_widget.dart';
import 'package:app_dev_project_medilink_app/widgets/health_tip_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri phoneNumber = Uri.parse('tel:+92-322-5801322');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Appbar(appbarHeading: 'MediLink Hub'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 213, 161, 161),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.89,
                  //   padding: const EdgeInsets.all(16.0),
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFAF1212),
                  //     borderRadius: BorderRadius.circular(12.0),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         'Random Health Tip',
                  //         style: TextStyle(
                  //           fontSize: 18.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //       const SizedBox(height: 8.0),
                  //       const Text(
                  //         'Here goes your random health tip. You can add more text here.',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       const SizedBox(height: 8.0),
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           // Add functionality for Read More button and pop-up here
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           foregroundColor: const Color(0xFFAF1212),
                  //           backgroundColor: Colors.white,
                  //         ),
                  //         child: const Text('Read More'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const HealthTipWidget(),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () async {
                      //     if (await canLaunch(phoneNumber.toString())) ;
                      //     await launch(phoneNumber.toString());
                      //   },
                      //   child: const CustomCard(
                      //     elevation: 0,
                      //     title: 'Emergency - Call an Ambulance',
                      //     image: 'assets/ambulance.jpg',
                      //   ),
                      // ),
                      InkWell(
                        onTap: () async {
                          // Navigator.pushNamed(context, '/emergency');
                          _callAmbulance();
                        },
                        child: const CustomCard(
                          elevation: 0,
                          title: 'Emergency - Call an Ambulance',
                          image: 'assets/ambulance.jpg',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/hospitalfinder');
                        },
                        child: const CustomCard(
                          elevation: 0,
                          title: 'Hospital Finder',
                          image: 'assets/hospital.jpg',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/doctorfinder');
                        },
                        child: const CustomCard(
                          elevation: 0,
                          title: 'Find a Doctor',
                          image: 'assets/doctor.jpg',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/bloodbankfinder');
                        },
                        child: const CustomCard(
                          elevation: 0,
                          title: 'Blood Bank Finder',
                          image: 'assets/bloodbank.jpg',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/firstaid');
                        },
                        child: const CustomCard(
                          elevation: 0,
                          title: 'First Aid',
                          image: 'assets/firstaid.jpg',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/medicinefinder');
                        },
                        child: const CustomCard(
                          elevation: 0,
                          title: 'Medicine Finder',
                          image: 'assets/medicine.jpg',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _callAmbulance() async {
    final Uri phoneNumber = Uri.parse('tel:+1122');
    if (await canLaunch(phoneNumber.toString())) {
      await launch(phoneNumber.toString());
    } else {
      print('Could not launch the dialer');
    }
  }
}
