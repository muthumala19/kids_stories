import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({
    Key? key,
    required this.backgroundColor,
    required this.list,
    required this.showAppBar,
    required this.appBarTitle,
  }) : super(key: key);

  final Color backgroundColor;
  final List<Category> list;
  final bool showAppBar;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: showAppBar
          ? AppBar(
              title: Text(
                appBarTitle,
                style: GoogleFonts.aBeeZee(
                    textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                    fontSize: 25),
                softWrap: true,
              ),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            )
          : null,
      body: const Center(
        child: Text("dummy"),
      ),
    );
  }
}
