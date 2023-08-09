import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _firebaseAuthentication = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isAuthenticating = false;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isAuthenticating = true;
    });
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    UserCredential userCredential =
        await _firebaseAuthentication.signInWithCredential(credential);
    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 200, 10, 0),
            width: double.infinity,
            child: DefaultTextStyle(
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
              child: AnimatedTextKit(
                pause: const Duration(milliseconds: 3000),
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Hello little,\nStep into a World of Fun and Learning! \nCome Inside and Explore!",
                    speed: const Duration(milliseconds: 150),
                    textStyle: GoogleFonts.lato(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 60,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: _isAuthenticating
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: Image.asset(
                                  "assets/images/Google__G__Logo.png",
                                  width: 25,
                                ),
                                onPressed: _signInWithGoogle,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    padding: const EdgeInsets.all(15)),
                                label: Text(
                                  "SignIn with Google",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
