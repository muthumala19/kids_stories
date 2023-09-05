import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/providers/bottom_navigation_provider.dart';
import 'package:kids_stories/providers/mark_as_read_provider.dart';
import 'package:kids_stories/providers/stories_provider.dart';
import 'package:kids_stories/screens/story_list_for_category_screen.dart';
import 'package:kids_stories/widgets/side_drawer_widget.dart';

import '../models/story_model.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import '../widgets/category_items_list_widget.dart';

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
    int activeTabIndex = ref.watch(bottomNavBarSelectionProvider);

    List<Story> stories = ref.watch(storiesProvider);
    Widget activeContent = const CategoryItemsList();
    String activeAppBarTitle = "Kids Story Categories";

    switch (activeTabIndex) {
      case 1:
        {
          final favouriteStories = ref.watch(markAsReadProvider);
          activeAppBarTitle = "All";
          activeContent = activeContent = StoriesScreen(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            list: stories
                .where((element) => !favouriteStories.contains(element.id))
                .toList(),
            showAppBar: false,
            appBarTitle: activeAppBarTitle,
          );
          break;
        }
      case 2:
        {
          final List<Story> favouriteStories = ref
              .watch(markAsReadProvider)
              .map((id) => stories.firstWhere((story) => story.id == id))
              .toList();
          activeAppBarTitle = "Completed";
          activeContent = StoriesScreen(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            list: favouriteStories,
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
