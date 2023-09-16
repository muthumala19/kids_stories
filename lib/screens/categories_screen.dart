import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/providers/bottom_navigation_provider.dart';
import 'package:kids_stories/providers/mark_as_read_provider.dart';
import 'package:kids_stories/providers/stories_provider.dart';
import 'package:kids_stories/screens/unread_stories_screen.dart';
import 'package:kids_stories/widgets/side_drawer_widget.dart';

import '../widgets/bottom_navigation_bar_widget.dart';
import '../widgets/category_items_list_widget.dart';
import 'completed_stories_screen.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(storiesProvider.notifier).fetchFirestoreStories();
    ref.read(markAsReadProvider.notifier).loadCompletedStoryIdList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    Widget activeContent = const CategoryItemsList();
    String activeAppBarTitle = "Kids Story Categories";

    switch (ref.watch(bottomNavBarSelectionProvider)) {
      case 1:
        {
          activeAppBarTitle = "Unread";
          activeContent = const UnreadStoriesScreen();
          break;
        }
      case 2:
        {
          activeAppBarTitle = "Completed";
          activeContent = const CompletedStoriesScreen();
          break;
        }
    }

    return SafeArea(
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          title: FittedBox(
            child: Text(
              activeAppBarTitle,
              style: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.06, // Responsive font size
                    ),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: activeContent,
        bottomNavigationBar: const BottomNavigationTabs(),
      ),
    );
  }
}
