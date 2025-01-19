import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallete.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_category_section.dart';
import '../widgets/home_heading_section.dart';
import '../widgets/home_recent_card.dart';
import '../widgets/home_textfield.dart';
import '../widgets/home_upcoming_section.dart';

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
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const HomeTextfield(hintText: "Search Categories..."),
                        const SizedBox(height: 10),
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is HomeLoading) {
                              return SizedBox(
                                height: screenHeight * .17,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (state is HomeLoadingSuccess) {
                              final quiz = state.quiz;
                              return HomeRecentCard(
                                screenHeight: screenHeight,
                                title: quiz.title,
                                topic: quiz.topic,
                                questions: quiz.questionsCount,
                              );
                            } else if (state is HomeLoadingFailure) {
                              return SizedBox(
                                height: screenHeight * .17,
                                child: Center(
                                  child: Text(state.message),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ],
                    ),
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
