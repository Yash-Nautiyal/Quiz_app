import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:brainstock/features/stats/presentation/widgets/stats_leaderboard.dart';
import 'package:brainstock/features/stats/presentation/widgets/stats_podium.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppPallete.background,
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: SvgPicture.asset(
              "assets/svgs/background.svg",
              alignment: Alignment.bottomCenter.add(Alignment(0, -.45)),
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    "Leaderboard",
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppPallete.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppPallete.buttonBackground,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Weekly",
                              style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  color: AppPallete.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "All Time",
                              style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  color: AppPallete.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppPallete.lightorange,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppPallete.orange,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text("#4",
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: AppPallete.white)),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'You are doing better than 60% of other players!',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.rubik(
                                  color: AppPallete.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * .32,
            left: 0,
            right: 0,
            child: StatsPodium(
                screenWidth: screenWidth, screenHeight: screenHeight),
          ),
          const LeaderboardSheet(
            entries: [
              LeaderboardEntry(
                name: 'Davis Curtis',
                points: 2569,
                avatarPath: 'assets/images/Avatar1.png',
                countryCode: 'PT',
              ),
              LeaderboardEntry(
                name: 'Alena Donin',
                points: 1469,
                avatarPath: 'assets/images/Avatar2.png',
                countryCode: 'FR',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
