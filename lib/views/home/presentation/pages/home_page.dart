import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:brainstock/views/home/presentation/widgets/home_heading_section.dart';
import 'package:brainstock/views/home/presentation/widgets/home_recent_card.dart';
import 'package:brainstock/views/home/presentation/widgets/home_category_section.dart';
import 'package:brainstock/views/home/presentation/widgets/home_textfield.dart';
import 'package:brainstock/views/home/presentation/widgets/home_upcoming_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppPallete.white,
      body: CustomScrollView(
        slivers: [
          // Sticky App Bar Section
          SliverAppBar(
            title: const HomeHeadingSection(name: "Madelyn Dias"),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            backgroundColor: AppPallete.background,
            expandedHeight: screenHeight * 0.35,
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      const HomeTextfield(hintText: "Search Categories..."),
                      const SizedBox(height: 10),
                      HomeRecentCard(screenHeight: screenHeight),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main Content Section
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const HomeCategorySection(),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: RecentActivities(),
                ), // Scrollable Recent Activities
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
