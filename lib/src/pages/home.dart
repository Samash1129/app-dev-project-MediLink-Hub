import 'package:app_dev_project_medilink_app/src/widgets/Appbar.dart';
import 'package:app_dev_project_medilink_app/src/widgets/Cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Appbar(appbarHeading: 'MediLink Hub'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 175,
            decoration: BoxDecoration(
              color: Colors.redAccent[700],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris a diam maecenas sed enim ut sem viverra aliquet eget sit amet tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra magna ac placerat vestibulum lectus mauris ultrices eros in cursus turpis massa tincidunt dui ut ornare lectus sit amet est placerat in egestas erat imperdiet sed euismod nisi porta lorem mollis aliquam',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.62,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  CustomCard(
                    elevation: 0,
                    title: 'Emergency - Call an Ambulance',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: 'Hospital Finder',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: 'Find a Doctor',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: 'Blood Bank Finder',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: 'First Aid',
                  ),
                  CustomCard(
                    elevation: 0,
                    title: 'Contact Us',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
