import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String image;

  const SubjectCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppPallete.buttonBackground,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 14,
                  left: 14,
                  child: Text(
                    title,
                    style: GoogleFonts.rubik(
                      color: AppPallete.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  right: -20,
                  bottom: -20,
                  child: ClipRect(
                    child: Image.asset(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
