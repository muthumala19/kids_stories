import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryCardTrait extends StatelessWidget {
  const StoryCardTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Calculate icon size and spacing based on screen width
    double iconSize = screenWidth * 0.02; // Adjust the factor as needed
    double sizedBoxWidth = screenWidth * 0.01; // Adjust the factor as needed

    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize, // Use the calculated icon size
        ),
        SizedBox(
          width: sizedBoxWidth, // Use the calculated spacing
        ),
        Text(
          label,
          style: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
