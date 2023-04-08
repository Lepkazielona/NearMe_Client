import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login/login_mail.dart';

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

  final Widget googleIcon = SvgPicture.asset(
    "assets/Google_ G _Logo.svg",
  );

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
            Text(
              _regText,
              style: TextStyle(fontSize: 25),
            ),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => print("emaillogin"),
                    icon: FaIcon(FontAwesomeIcons.google),
                    label: Text("$_regText using Google"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => print("emaillogin"),
                    icon: FaIcon(FontAwesomeIcons.apple),
                    label: Text("$_regText using Apple"),
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
