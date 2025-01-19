import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:uicons_pro/uicons_pro.dart';

class Menu extends StatefulWidget {
  final double screenWidth;
  final int currentIndex;
  final Function(int) onIconPressed;

  const Menu({
    super.key,
    required this.screenWidth,
    required this.currentIndex,
    required this.onIconPressed,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<IconData> listOfIcons = [
    UIconsPro.boldRounded.home,
    UIconsPro.boldRounded.stats,
    UIconsPro.boldRounded.user,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.screenWidth,
      height: 70,
      color: Colors.transparent,
      child: Center(
        child: GlassContainer(
          opacity: 0.45,
          blur: 2.5,
          width: widget.screenWidth * .65,
          height: 55,
          borderRadius: BorderRadius.circular(50),
          shadowColor: Colors.black.withOpacity(.45),
          shadowStrength: 6,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * .02),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                widget.onIconPressed(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom:
                          index == widget.currentIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .120,
                    height:
                        index == widget.currentIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: AppPallete.black,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .06,
                    color: index == widget.currentIndex
                        ? AppPallete.black
                        : Colors.grey,
                  ),
                  SizedBox(height: size.width * .02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
