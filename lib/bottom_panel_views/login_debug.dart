import 'package:flutter/material.dart';

class LoginViewDebug extends StatefulWidget {
  const LoginViewDebug({super.key});

  @override
  State<LoginViewDebug> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginViewDebug> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("LOGIN"),),
    );
  }
}