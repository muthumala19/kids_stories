import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/widgets/mark_as_read_trait_widget.dart';

import '../models/story_model.dart';

class StoryDetailsScreen extends StatelessWidget {
  const StoryDetailsScreen({
    Key? key,
    required this.backgroundColor,
    required this.story,
  }) : super(key: key);

  final Color backgroundColor;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          story.title,
          style: GoogleFonts.aBeeZee(
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              fontSize: 18),
          softWrap: true,
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: story.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 5 / 3,
                          child: Image.network(
                            story.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ...story.paragraphs
                    .map((paragraph) => Text(
                          "$paragraph\n",
                          style: GoogleFonts.aBeeZee(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          softWrap: true,
                        ))
                    .toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Mark as Read ?',
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                    Center(child: MarkAsRead(id: story.id, isTappable: true))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
