import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomColorStyles extends Color {
  CustomColorStyles(int value) : super(value);

  Color get c8b6ff => HexColor("#c8b6ff");

  Color get b8c0ff => HexColor("#b8c0ff");

  Color get bbd0ff => HexColor("#bbd0ff");

  Color get ffd6ff => HexColor("#ffd6ff");

  Color get e7c6ff => HexColor("#e7c6ff");

  Color get black => Colors.black;

  Color get white => Colors.white;

  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    HexColor("#b8c0ff"),
    Color(0xffFBAB57),
    HexColor("#e7c6ff"),
    HexColor("#c8b6ff"),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];
}