import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double elevation;
  final String title;
  final double? height;
  final String? description;

  const CustomCard({
    Key? key,
    required this.elevation,
    required this.title,
    this.height,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 220,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: const Color.fromARGB(100, 211, 211, 211),
        elevation: elevation, // Add elevation for a shadow effect
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Set padding for content spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0), // Add space between title and description
              Text(description ?? '')
            ],
          ),
        ),
      ),
    );
  }
}
