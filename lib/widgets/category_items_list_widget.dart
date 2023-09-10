import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
import 'category_item_widget.dart';

class CategoryItemsList extends ConsumerStatefulWidget {
  const CategoryItemsList({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoryItemsList> createState() => _CategoryItemsListState();
}

class _CategoryItemsListState extends ConsumerState<CategoryItemsList>
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

    // Calculate the number of columns based on screen width
    int crossAxisCount = (screenWidth / 200).floor(); // Adjust 200 to your desired card width

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          itemBuilder: (ctx, index) {
            if (index < categories.length) {
              final category = categories[index];
              return CategoryItem(category: category);
            }
            return null;
            // return Container(); // Return an empty container for extra items
          },
        ),
      ),
    );
  }
}
