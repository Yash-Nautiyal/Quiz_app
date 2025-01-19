import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uicons_pro/uicons_pro.dart';

class HomeTextfield extends StatelessWidget {
  final String hintText;
  const HomeTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          UIconsPro.boldRounded.search,
          color: AppPallete.white,
        ),
      ),
      style: GoogleFonts.rubik(color: AppPallete.white),
    );
  }
}
