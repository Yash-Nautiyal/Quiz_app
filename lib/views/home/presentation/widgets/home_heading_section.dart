import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeadingSection extends StatelessWidget {
  final String name;
  const HomeHeadingSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: GoogleFonts.rubik(
                  color: AppPallete.lightpink,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              name,
              style: GoogleFonts.rubik(
                  color: AppPallete.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Image.asset("assets/images/Avatar4.png")
      ],
    );
  }
}
