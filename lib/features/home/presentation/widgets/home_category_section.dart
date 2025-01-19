import 'package:brainstock/core/theme/app_pallete.dart';
import 'package:brainstock/features/home/presentation/widgets/home_subject_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Subject {
  final String name;
  final String imagePath;

  const Subject({
    required this.name,
    required this.imagePath,
  });
}

const List<Subject> subjects = [
  Subject(
    name: 'Math',
    imagePath: 'assets/images/compass.png',
  ),
  Subject(
    name: 'Chemistry',
    imagePath: 'assets/images/molecule.png',
  ),
  Subject(
    name: 'Physics',
    imagePath: 'assets/images/atom.png',
  ),
];

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: GoogleFonts.rubik(
                fontSize: 20,
                color: AppPallete.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: GoogleFonts.rubik(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            itemCount: subjects.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SubjectCard(
                  title: subjects[index].name,
                  image: subjects[index].imagePath,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
