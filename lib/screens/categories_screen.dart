import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/providers/bottom_navigation_provider.dart';
import 'package:kids_stories/screens/story_list_for_category_screen.dart';
import 'package:kids_stories/widgets/side_drawer_widget.dart';

import '../data/data.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import '../widgets/category_items_list_widget.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeTabIndex = ref.watch(bottomNavBarSelectionProvider);
    Widget activeContent = const CategoryItemsList();
    String activeAppBarTitle = "Kids Story Categories";

    switch (activeTabIndex) {
      case 1:
        {
          activeAppBarTitle = "All";
          activeContent = activeContent = StoriesScreen(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            list: stories,
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
