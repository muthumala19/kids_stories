import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_stories/providers/mark_as_read_provider.dart';

class MarkAsRead extends ConsumerStatefulWidget {
  const MarkAsRead({
    super.key,
    required this.id,
    required this.isTappable,
  });

  final String id;
  final bool isTappable;

  @override
  ConsumerState<MarkAsRead> createState() {
    return _FavouriteTraitState();
  }
}

class _FavouriteTraitState extends ConsumerState<MarkAsRead> {
  @override
  Widget build(BuildContext context) {
    bool isCompleted = ref.watch(markAsReadProvider).contains(widget.id);

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Calculate icon size based on screen width
    double iconSize = screenWidth * 0.08; // Adjust the factor as needed

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: widget.isTappable
                ? () {
              ref
                  .read(markAsReadProvider.notifier)
                  .toggleMarkAsRead(widget.id, !isCompleted);
            }
                : null,
            child: CircleAvatar(
              radius: iconSize / 2,
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .secondary
                  .withOpacity(0.7),
              child: Icon(
                Icons.task_alt_rounded,
                color: isCompleted ? Colors.green : null,
                size: iconSize, // Use the calculated icon size
              ),
            ),
          )
        ],
      ),
    );
  }
}
