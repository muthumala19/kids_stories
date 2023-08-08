import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/data/data.dart';
import 'package:kids_stories/widgets/bottom_navigation_bar.dart';
import 'package:kids_stories/widgets/side_drawer.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideDrawer(),
        bottomNavigationBar: const BottomNavigationTabs(),
        appBar: AppBar(
          title: Text(
            "Kids Categories",
            style: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
                fontSize: 25),
            softWrap: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // color: Theme.of(context).colorScheme.primary,
          child: GridView(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 9 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              for (final category in categories)
                CategoryItem(
                  category: category,
                )
            ],
          ),
        ),
      ),
    );
  }
}
