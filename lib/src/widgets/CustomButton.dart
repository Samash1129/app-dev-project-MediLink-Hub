// ignore: file_names
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle? textStyle;
  final String? imageAssetPath;
  final double width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textStyle,
    this.imageAssetPath,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageAssetPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Image.asset(
                    imageAssetPath!,
                    width: 24.0, // Adjust the width of the image if needed
                    height: 24.0, // Adjust the height of the image if needed
                  ),
                ),
              ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
