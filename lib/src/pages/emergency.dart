import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';

class EmergencyScreen extends StatelessWidget {
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
                const Appbar(appbarHeading: 'Emergency Services'),
              ],
            ),
          ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white, // Change the background color
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        24.8607, 67.0011), // Coordinates for Karachi, Pakistan
                    zoom: 15.0,
                  ),
                  markers: Set<Marker>.from([
                    Marker(
                      markerId: MarkerId('hospital1'),
                      position:
                          LatLng(24.8607, 67.0011), // Hospital 1 coordinates
                      infoWindow: InfoWindow(title: 'Hospital 1'),
                    ),
                    // Add more markers for other hospitals as needed
                  ]),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _callAmbulance();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFAF1212),
                    onPrimary: Colors.white,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      56,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: Text(
                    'Call Ambulance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch the dialer with "1122" pre-filled
  void _callAmbulance() async {
    final Uri phoneNumber = Uri.parse('tel:+1122');
    if (await canLaunch(phoneNumber.toString())) {
      await launch(phoneNumber.toString());
    } else {
      print('Could not launch the dialer');
    }
  }
}
