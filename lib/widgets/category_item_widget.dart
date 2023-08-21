import 'package:flutter/material.dart';
import 'package:kids_stories/data/data.dart';
import 'package:kids_stories/models/category_model.dart';
import 'package:transparent_image/transparent_image.dart';

import '../screens/story_list_for_category_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    double titleFontSize = 15;
    double cardMargin = 10;
    double cardBorderRadius = 10;
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
          final selectedStories = stories.where(
            (element) {
              return element.categories.contains(category.id);
            },
          ).toList();
          // for(){};
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
              aspectRatio: 2 / 2,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(category.imagePath),
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black45,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category.title,
                          maxLines: maxLinesOfTitle,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          // to long texts add "..."

                          style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
