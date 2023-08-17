import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/models/category_model.dart';

import '../screens/story_list_for_category_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => StoriesScreen(
              backgroundColor: category.color.withOpacity(0.3),
              appBarTitle: category.title,
              list: const [],
              showAppBar: true,
            ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          category.title,
          style: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
