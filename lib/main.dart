import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kids_stories/screens/auth.dart';
import 'package:kids_stories/screens/categories.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 66, 95, 87),
          primary: const Color.fromARGB(255, 34, 87, 126),
          secondary: const Color.fromARGB(255, 149, 209, 204),
          secondaryContainer: const Color.fromARGB(255, 246, 242, 212),
          primaryContainer: const Color.fromARGB(255, 85, 132, 172),
          // seedColor: const Color.fromARGB(255, 17, 177, 148),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return const SplashScreen();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            print(snapshot.data);
            return const CategoryScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
