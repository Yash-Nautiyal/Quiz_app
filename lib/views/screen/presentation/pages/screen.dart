import 'package:brainstock/profile_page.dart';
import 'package:brainstock/views/screen/presentation/widgets/bottom_menu.dart';
import 'package:brainstock/views/views.dart';

import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  final int initialPage;

  const Screen({
    super.key,
    this.initialPage = 0, // Default to the first page if no page is specified
  });

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late PageController pageController;
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: widget.initialPage); // Set the initial page
    _currentPageNotifier.value =
        widget.initialPage; // Set the initial value for the notifier
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          _currentPageNotifier.value = index;
        },
        children: const [HomePage(), StatsPage(), ProfilePage()],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentPageNotifier,
        builder: (context, currentIndex, child) {
          return Menu(
            screenWidth: screenWidth,
            currentIndex: currentIndex,
            onIconPressed: (index) {
              if (currentIndex + 1 != index && currentIndex - 1 != index) {
                pageController.animateToPage(index,
                    duration: Durations.medium1, curve: Curves.easeInOut);
              } else if (currentIndex + 1 == index ||
                  currentIndex - 1 == index) {
                pageController.animateToPage(index,
                    duration: Durations.medium4, curve: Curves.easeInOut);
              }
              _currentPageNotifier.value = index;
            },
          );
        },
      ),
    );
  }
}
