import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login/login_mail.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _register = false;
  String _regText = "Login";

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("no user logged in");
      } else {
        print("User signed in");
      }
    });

    super.initState();
  }

  void switchRegisterAndLogin() {
    setState(() {
      _register = !_register;
      if (_register) {
        _regText = "Sign In";
      } else {
        _regText = "Log In";
      }
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print(googleUser?.displayName);
    print(googleUser);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("no user logged in");
      } else {
        print("Logged In");
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Text(
                _regText,
                style: TextStyle(fontSize: 50),
              ),
            ),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /*
                    MAIL
                  */
                  ElevatedButton.icon(
                    onPressed: () => {
                      print("Email Login"),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginMailScreen()))
                    },
                    icon: Icon(Icons.mail),
                    label: Text("$_regText using Email"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white38),
                  ),
                  /*
                    GOOGLE
                  */
                  ElevatedButton.icon(
                    label: Text("$_regText using Google"),
                    icon: FaIcon(FontAwesomeIcons.google),
                    onPressed: signInWithGoogle,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  /*
                    APPLE
                  */
                  ElevatedButton.icon(
                    label: Text("$_regText using Facebook"),
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    onPressed: () => print("emaillogin"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  ElevatedButton.icon(
                    label: Text("$_regText using Apple"),
                    icon: FaIcon(FontAwesomeIcons.apple),
                    onPressed: () => print("emaillogin"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  TextButton(
                    onPressed: switchRegisterAndLogin,
                    child: Text(_register ? "Log In" : "Sign In",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
