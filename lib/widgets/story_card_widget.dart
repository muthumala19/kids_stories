import 'package:flutter/material.dart';
import 'package:kids_stories/widgets/mark_as_read_trait_widget.dart';
import 'package:kids_stories/widgets/story_card_trait_widget.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/story_model.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.story,
    required this.onTapStoryCard,
  });

  final Story story;
  final void Function(Story story) onTapStoryCard;

  String get complexityText =>
      story.complexity.name[0].toUpperCase() +
          story.complexity.name.substring(1);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Responsive values
    double titleFontSize = screenWidth * 0.04;
    double cardMargin = screenWidth * 0.02;
    double cardBorderRadius = screenWidth*0.05;
    double cardElevation = 2;
    int maxLinesOfTitle = 1;

    return Card(
      elevation: cardElevation,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(cardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      child: InkWell(
        onTap: () {
          onTapStoryCard(story);
        },
        child: Stack(
          children: [
            Hero(
              tag: story.id,
              child: AspectRatio(
                aspectRatio: 5 / 3, // You can calculate this based on screen width
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(story.imageUrl),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          story.title,
                          maxLines: maxLinesOfTitle,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5), // Responsive sized box
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        StoryCardTrait(
                          icon: Icons.schedule,
                          label: '${story.duration} min',
                        ),
                        const Spacer(),
                        StoryCardTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            MarkAsRead(id: story.id, isTappable: false),
          ],
        ),
      ),
    );
  }
}
