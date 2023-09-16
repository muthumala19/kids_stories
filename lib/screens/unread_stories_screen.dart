import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/screens/story_details_screen.dart';
import 'package:kids_stories/widgets/story_card_widget.dart';

import '../models/story_model.dart';
import '../providers/mark_as_read_provider.dart';
import '../providers/stories_provider.dart';

class UnreadStoriesScreen extends ConsumerStatefulWidget {
  const UnreadStoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<UnreadStoriesScreen> createState() =>
      _UnreadStoriesScreenState();
}

class _UnreadStoriesScreenState extends ConsumerState<UnreadStoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Story> unreadStories;
  late List<Story> stories;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
    ref.read(storiesProvider.notifier).fetchFirestoreStories();
    ref.read(markAsReadProvider.notifier).loadCompletedStoryIdList();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    // Responsive values

    stories = ref.watch(storiesProvider);
    final completedStories = ref.watch(markAsReadProvider);
    unreadStories = stories
        .where((element) => !completedStories.contains(element.id))
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      body: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenWidth * 0.05),
              topLeft: Radius.circular(screenWidth * 0.05),
            ),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          ),
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return SlideTransition(
                position: Tween(
                  begin: const Offset(0, 1),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                      parent: _animationController, curve: Curves.easeInOut),
                ),
                child: child,
              );
            },
            child: unreadStories.isEmpty
                ? Center(
                    child: Text(
                      "OOPs.! Nothing to show.",
                      style: GoogleFonts.aBeeZee(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                        fontSize: 25,
                      ),
                      softWrap: true,
                    ),
                  )
                : ListView.builder(
                    itemCount: unreadStories.length,
                    itemBuilder: (context, index) => StoryCard(
                      story: unreadStories[index],
                      onTapStoryCard: (story) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => StoryDetailsScreen(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              story: story),
                        ));
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
