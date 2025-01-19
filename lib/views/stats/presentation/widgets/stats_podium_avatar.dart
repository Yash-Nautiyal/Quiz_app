import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsPodiumAvatar extends StatelessWidget {
  final String name;
  final int points;
  final String avatar;
  final PodiumPosition position;

  const StatsPodiumAvatar({
    super.key,
    required this.name,
    required this.points,
    required this.avatar,
    this.position = PodiumPosition.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAvatar(),
        const SizedBox(height: 7),
        SizedBox(
          width: 100,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: AppPallete.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Container(
          decoration: BoxDecoration(
            color: AppPallete.buttonBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "$points CD",
              style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppPallete.white),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAvatar() {
    final avatar = CircleAvatar(
      radius: 32,
      child: Image.asset(
        this.avatar,
        fit: BoxFit.fill,
      ),
    );

    if (position != PodiumPosition.first) {
      return avatar;
    }

    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: avatar,
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage("assets/images/Medal.png"),
          ),
        )
      ],
    );
  }
}

enum PodiumPosition { first, second, third, normal }
