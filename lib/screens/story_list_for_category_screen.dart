import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/screens/story_details_screen.dart';
import 'package:kids_stories/widgets/story_card_widget.dart';

import '../models/story_model.dart';

class StoriesScreen extends ConsumerStatefulWidget {
  const StoriesScreen({
    Key? key,
    required this.backgroundColor,
    required this.list,
    required this.showAppBar,
    required this.appBarTitle,
  }) : super(key: key);

  final Color backgroundColor;
  final List<Story> list;
  final bool showAppBar;
  final String appBarTitle;

  @override
  ConsumerState<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends ConsumerState<StoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
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
    double appBarFontSize = screenWidth * 0.05;

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                widget.appBarTitle,
                style: GoogleFonts.aBeeZee(
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: appBarFontSize,
                      ),
                ),
                softWrap: true,
              ),
              backgroundColor: widget.backgroundColor,
            )
          : null,
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      body: Container(
        color: widget.backgroundColor,
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
            child: widget.list.isEmpty
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
                    itemCount: widget.list.length,
                    itemBuilder: (context, index) => StoryCard(
                      story: widget.list[index],
                      onTapStoryCard: (story) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => StoryDetailsScreen(
                              backgroundColor: widget.backgroundColor,
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
