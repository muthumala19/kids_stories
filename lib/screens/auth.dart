import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _firebaseAuthentication = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  final _form = GlobalKey<FormState>();
  late String _enteredEmail;
  late String _enteredPassword;
  bool _isAuthenticating = false;

  bool _validateAndSave() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      return true;
    }
    return false;
  }

  Future<void> _signUserIn() async {
    if (!_validateAndSave()) {
      return;
    }
    setState(() {
      _isAuthenticating = true;
    });
    try {
      final userCredential =
          await _firebaseAuthentication.signInWithEmailAndPassword(
              email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException catch (err) {
      if (err.code == "email-already-in-use") {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message ?? "Authentication failed"),
        ),
      );
    } finally {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  Future<void> _signUserUp() async {
    if (!_validateAndSave()) {
      return;
    }
    setState(() {
      _isAuthenticating = true;
    });
    try {
      final userCredential =
          await _firebaseAuthentication.createUserWithEmailAndPassword(
              email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException catch (err) {
      if (err.code == "email-already-in-use") {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message ?? "Authentication failed"),
        ),
      );
    } finally {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              width: double.infinity,
              child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondaryContainer),
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
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withOpacity(0.9),
                      margin: const EdgeInsets.fromLTRB(20, 150, 20, 0),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Form(
                            key: _form,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const TabBar(
                                  tabs: [
                                    Tab(
                                      child: Text("Sign In"),
                                    ),
                                    Tab(
                                      child: Text("Sign Up"),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Email Address ",
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    autocorrect: false,
                                    textCapitalization: TextCapitalization.none,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          !value.contains("@")) {
                                        return "Please enter a valid Email.";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      _enteredEmail = val!;
                                    },
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Password ",
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 8) {
                                      return "Password must be at least 8 characters long.";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _enteredPassword = val!;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SizedBox(
                                    height: 50,
                                    width: double.maxFinite,
                                    child: _isAuthenticating
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : TabBarView(
                                            children: [
                                              ElevatedButton(
                                                onPressed: _signUserIn,
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .outlineVariant,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 0, 20, 0),
                                                ),
                                                child: const Text("Sign In"),
                                              ),
                                              ElevatedButton(
                                                onPressed: _signUserUp,
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .outlineVariant,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 0, 20, 0),
                                                ),
                                                child: const Text("Sign Up"),
                                              ),
                                            ],
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
