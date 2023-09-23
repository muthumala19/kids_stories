import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _firebaseAuthentication = FirebaseAuth.instance;

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isAuthenticating = false;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isAuthenticating = true;
    });
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await _firebaseAuthentication.signInWithCredential(credential);
    setState(
      () {
        _isAuthenticating = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/auth_screen_background.webp"),
          ),
        ),
        child: Stack(

          children: [
            Positioned(
              top: screenHeight * 0.15,
              left: 10,
              right: 10,
              child: DefaultTextStyle(
                style: TextStyle(
                  height: 2,letterSpacing: 3,
                  fontSize: screenWidth * 0.09,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Center(
                  child: AnimatedTextKit(
                    pause: const Duration(milliseconds: 5000),
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Hello little,\nStep into a World of \nFun and Learning! \nCome Inside and Explore!",
                        speed: const Duration(milliseconds: 150),
                        textAlign: TextAlign.center,
                        textStyle: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: screenHeight * 0.1,
              child: Center(
                child: Column(
                  children: [
                    _isAuthenticating
                        ? const CircularProgressIndicator()
                        : Container(
                            margin: const EdgeInsets.all(20),
                            width: screenWidth * 0.8,
                            child: ElevatedButton.icon(
                              icon: Image.asset(
                                "assets/images/Google__G__Logo.webp",
                                width: screenWidth * 0.05,
                              ),
                              onPressed: _signInWithGoogle,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                padding: EdgeInsets.all(screenWidth * 0.04),
                              ),
                              label: Text(
                                "Sign In with Google",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
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
