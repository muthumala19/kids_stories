import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryCardTrait extends StatelessWidget {
  const StoryCardTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    double sizedBoxWidth = 1;
    double iconSize = 17;
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        SizedBox(
          width: sizedBoxWidth,
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
