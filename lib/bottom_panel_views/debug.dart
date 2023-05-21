import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:near_me_client/screens/DEBUG_FIREBASE_TEST.dart';
import 'package:near_me_client/screens/login_view.dart';

class DebugMenu extends StatefulWidget {
  const DebugMenu({super.key});

  @override
  State<DebugMenu> createState() => _DebugMenuState();
}

class _DebugMenuState extends State<DebugMenu> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      ElevatedButton(
        onPressed: () => {print("logout"), FirebaseAuth.instance.signOut()},
        child: Text("logout"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
      ),
      ElevatedButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginView())),
        child: Text("Login Screen"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
      ),
      ElevatedButton(
        onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const DebugFirabaseLogin())),
        child: Text("DEBUG LOGIN TEST 1"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
      ),
      ElevatedButton(
        onPressed: () => {
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user != null) {
              print(user);
            }
          })
        },
        child: Text("login info"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
      )
    ]));
  }
}

/**
 * 
 * 

 */
