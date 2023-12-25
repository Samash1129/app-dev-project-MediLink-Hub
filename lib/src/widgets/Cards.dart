import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double elevation;
  final String title;
  final double? height;
  final String? description;
  final String? image;

  const CustomCard({
    Key? key,
    required this.elevation,
    required this.title,
    this.height,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 220,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: const Color.fromARGB(100, 211, 211, 211),
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              if (image != null) ...[
                const SizedBox(height: 8.0),
                Container(
                  height: 146, // Adjust the height as needed
                  width: double.infinity, // Take the full width
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image!),
                      fit:
                          BoxFit.fill, // Use BoxFit.cover to fill the container
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
              if (description != null) ...[
                const SizedBox(height: 8.0),
                Text(description!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
