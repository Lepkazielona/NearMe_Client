import 'package:flutter/material.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({super.key});

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("LISTA ZNAJOMYCH bo nie mam przyjaciol :(((("),
      ),
    );
  }
}
