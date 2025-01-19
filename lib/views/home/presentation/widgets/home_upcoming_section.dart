import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';
import 'package:uicons_pro/uicons_pro.dart';

class RecentActivity {
  final String subject;
  final String topic;
  final String svg;
  final int questionCount;
  final bool isCompleted;

  const RecentActivity({
    required this.subject,
    required this.topic,
    required this.svg,
    required this.questionCount,
    required this.isCompleted,
  });
}

final List<RecentActivity> recentActivities = [
  const RecentActivity(
    subject: 'Maths',
    topic: 'Statistics Math Quiz',
    svg: "assets/svgs/stats.svg",
    questionCount: 12,
    isCompleted: true,
  ),
  const RecentActivity(
    subject: 'Maths',
    topic: 'Matrices Quiz',
    svg: "assets/svgs/matrix.svg",
    questionCount: 12,
    isCompleted: true,
  ),
  const RecentActivity(
    subject: 'Maths',
    topic: 'Integer Quiz',
    svg: "assets/svgs/integer.svg",
    questionCount: 12,
    isCompleted: true,
  ),
];

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Quizes',
          style: GoogleFonts.rubik(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppPallete.black,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: recentActivities.length,
          itemBuilder: (context, index) {
            final activity = recentActivities[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: RecentActivityCard(activity: activity),
            );
          },
        ),
      ],
    );
  }
}

class RecentActivityCard extends StatelessWidget {
  final RecentActivity activity;

  const RecentActivityCard({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEFEEFC)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(activity.svg),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.topic,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        activity.subject,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                            fontSize: 13,
                            color: AppPallete.black.withAlpha(100),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: AppPallete.black.withAlpha(100),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        '${activity.questionCount} questions',
                        style: GoogleFonts.rubik(
                            fontSize: 13,
                            color: AppPallete.black.withAlpha(100),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              UIconsPro.boldRounded.angle_right,
              color: AppPallete.background,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
