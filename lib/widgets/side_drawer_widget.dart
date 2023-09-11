import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids_stories/screens/categories_screen.dart';

import '../providers/bottom_navigation_provider.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuthentication = FirebaseAuth.instance;
    final userEmail = firebaseAuthentication.currentUser!.email;
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Drawer(
      width: screenWidth * 0.8, // Responsive drawer width
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: screenHeight * 0.4, // Responsive drawer header height
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  CircleAvatar(
                    radius: screenHeight * 0.1, // Responsive avatar size
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      userEmail!,
                      style: TextStyle(
                        fontSize: screenHeight * 0.03, // Responsive font size
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              size: screenHeight * 0.02,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: screenHeight * 0.02),
            ),
            onTap: () {
              ref
                  .read(bottomNavBarSelectionProvider.notifier)
                  .selectBottomNavBar(0);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const CategoriesScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading:  Icon(Icons.logout,size: screenHeight*0.02,),
            title:  Text('Sign Out',style: TextStyle(fontSize: screenHeight*0.02),),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
