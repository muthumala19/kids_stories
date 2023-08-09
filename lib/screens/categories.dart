import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/data/data.dart';
import 'package:kids_stories/providers/bottom_navigation_provider.dart';
import 'package:kids_stories/screens/stories.dart';
import 'package:kids_stories/widgets/bottom_navigation_bar.dart';
import 'package:kids_stories/widgets/side_drawer.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeTabIndex = ref.watch(bottomNavBarSelectionProvider);
    Widget activeContent = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
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
    );
    String activeAppBarTitle = "Kids Story Categories";

    switch (activeTabIndex) {
      case 1:
        {
          activeAppBarTitle = "All";
          activeContent = StoriesScreen(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            list: const [],
            showAppBar: false,
            appBarTitle: activeAppBarTitle,
          );
          break;
        }
      case 2:
        {
          activeAppBarTitle = "Favourites";
          activeContent = StoriesScreen(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            list: const [],
            showAppBar: false,
            appBarTitle: activeAppBarTitle,
          );
          break;
        }
      case 3:
        {
          activeAppBarTitle = "Trending";
          activeContent = StoriesScreen(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            list: const [],
            showAppBar: false,
            appBarTitle: activeAppBarTitle,
          );
          break;
        }
    }

    return SafeArea(
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          title: Text(
            activeAppBarTitle,
            style: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
                fontSize: 25),
            softWrap: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: activeContent,
        bottomNavigationBar: const BottomNavigationTabs(),
      ),
    );
  }
}
