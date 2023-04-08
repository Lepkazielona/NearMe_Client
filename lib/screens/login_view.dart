import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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

  final Widget googleIcon = SvgPicture.asset(
    "assets/Google_ G _Logo.svg",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(children: [
          const Text(
            'Log In',
            style: TextStyle(fontSize: 25),
          ),
          IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                    onPressed: () => print("emaillogin"),
                    icon: Icon(Icons.mail),
                    label: Text("Login using Email")),
                ElevatedButton.icon(
                  onPressed: () => print("emaillogin"),
                  icon: FaIcon(FontAwesomeIcons.google),
                  label: Text("Login using Google"),
                ),
                ElevatedButton.icon(
                  onPressed: () => print("emaillogin"),
                  icon: FaIcon(FontAwesomeIcons.apple),
                  label: Text("Login using Apple"),
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
