import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_stories/data/data.dart';

import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout))
          ],
          title: Text(
            "Kids Categories",
            style: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontWeight: FontWeight.bold),
                fontSize: 25),
            softWrap: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // color: Theme.of(context).colorScheme.primary,
          child: GridView(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              for (final category in categories)
                CategoryItem(
                  category: category,
                )
            ],
          ),
        ),
      ),
    );
  }
}
