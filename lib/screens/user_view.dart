import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserView extends StatelessWidget {
  UserView({super.key});
  final Widget usrPic = SvgPicture.asset('assets/PlaceHolder.svg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          usrPic,
          Text("""Litwo! Ojczyzno moja! ty jesteś jak zdrowie.

Ile cię trzeba cenić, ten tylko się dowie,

Kto cię stracił. Dziś piękność twą w całej ozdobie

Widzę i opisuję, bo tęsknię po tobie.""")
        ],
      ),
    );
  }
}
