import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_stories/models/category_model.dart';
import 'package:kids_stories/providers/stories_provider.dart';

import '../screens/story_list_for_category_screen.dart';

class CategoryItem extends ConsumerWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Responsive values
    double titleFontSize = screenWidth * 0.04;
    double cardMargin = screenWidth * 0.02;
    double cardBorderRadius = screenWidth * 0.04;
    double cardElevation = 2;
    double aspectRatio = 2 / 2;

    return Card(
      elevation: cardElevation,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(cardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      child: InkWell(
        onTap: () {
          final selectedStories = ref.watch(storiesProvider).where(
            (element) {
              return element.categories.contains(category.id);
            },
          ).toList();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => StoriesScreen(
                backgroundColor: category.color.withOpacity(0.3),
                appBarTitle: category.title,
                list: selectedStories,
                showAppBar: true,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio, // Adjusted aspect ratio
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.fitWidth, // Increase size to fully fit the card
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black45,
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.02), // Adjusted padding
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category.title,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: titleFontSize, // Adjusted font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
