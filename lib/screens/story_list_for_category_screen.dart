import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/screens/story_details_screen.dart';
import 'package:kids_stories/widgets/story_card_widget.dart';

import '../models/story_model.dart';

class StoriesScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                appBarTitle,
                style: GoogleFonts.aBeeZee(
                    textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    fontSize: 25),
                softWrap: true,
              ),
              backgroundColor: backgroundColor,
            )
          : null,
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      body: Container(
        color: backgroundColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          ),
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: list.isEmpty
              ? const Center(
                  child: Text("OOPs.! Nothing to show."),
                )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) => StoryCard(
                    story: list[index],
                    onTapStoryCard: (story) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => StoryDetailsScreen(
                            backgroundColor: backgroundColor, story: story),
                      ));
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
