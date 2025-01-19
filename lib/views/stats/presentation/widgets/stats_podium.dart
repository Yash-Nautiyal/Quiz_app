import 'package:brainstock/views/stats/presentation/widgets/stats_podium_avatar.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class StatsPodium extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const StatsPodium(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .2),
            child: SvgPicture.asset(
              "assets/svgs/podium.svg",
            ),
          ),
          const Positioned(
              left: 0,
              right: 0,
              child: StatsPodiumAvatar(
                name: "Davis Curtis",
                points: 2569,
                avatar: "assets/images/Avatar1.png",
                position: PodiumPosition.first,
              )),
          Positioned(
            left: 2,
            top: screenHeight * .07,
            child: const StatsPodiumAvatar(
                name: "Alena Donin",
                points: 1469,
                avatar: "assets/images/Avatar2.png"),
          ),
          Positioned(
              top: screenHeight * .11,
              right: 2,
              child: const StatsPodiumAvatar(
                  name: "Craig Gouse",
                  points: 1053,
                  avatar: "assets/images/Avatar3.png")),
        ],
      ),
    );
  }
}
