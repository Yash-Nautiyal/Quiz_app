import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';
import 'package:uicons_pro/uicons_pro.dart';

class HomeRecentCard extends StatelessWidget {
  final double screenHeight;
  final String topic;
  final String title;
  final int questions;
  const HomeRecentCard(
      {super.key,
      required this.screenHeight,
      required this.topic,
      required this.title,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * .17,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppPallete.lightpink,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset("assets/svgs/container_background.svg"),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                height: screenHeight * .17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppPallete.darkpink,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "RECENT QUIZ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.rubik(
                                fontSize: 14,
                                color: AppPallete.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "10",
                          style: GoogleFonts.rubik(
                              color: AppPallete.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Icon(
                          UIconsPro.solidRounded.coins,
                          color: AppPallete.orange,
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            topic,
                            style: GoogleFonts.rubik(
                              fontSize: 15,
                              color: AppPallete.darkred,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Wrap(
                            runSpacing: 5, // vertical spacing between lines
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                title,
                                style: GoogleFonts.rubik(
                                  fontSize: 13,
                                  color: AppPallete.darkred.withAlpha(100),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor:
                                        AppPallete.darkred.withAlpha(100),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "$questions Questions",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.rubik(
                                      fontSize: 13,
                                      color: AppPallete.darkred.withAlpha(100),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/svgs/microscope.svg",
              height: screenHeight * .15,
              fit: BoxFit.cover,
            )
          ],
        )
      ],
    );
  }
}

// Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: AnimatedBuilder(
//                 animation: _animation,
//                 builder: (context, child) {
//                   return Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       SizedBox(
//                         width: 57,
//                         child: CustomPaint(
//                           painter: HomeCircluarProgress(_animation.value),
//                         ),
//                       ),
//                       Text(
//                         "${(_animation.value * 100).toInt()}%", // Convert value to percentage
//                         style: GoogleFonts.rubik(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: AppPallete.white,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),