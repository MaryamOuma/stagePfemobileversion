import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const purple = Color(0xFF8E97FD);
const darkPurple = Color(0xFF7583CA);
const darkGrey = Color(0xFFA0A3B1);
const grey = Color(0xFFF2F3F7);
const black = Color(0xFF3F414E);
const bacground = Color(0xFFE5E5E5);
const lightYellow = Color(0xFFFFECCC);

TextStyle regular = GoogleFonts.lato(
  fontWeight: FontWeight.w400,
);

TextStyle medium = GoogleFonts.lato(
  fontWeight: FontWeight.w500,
);

TextStyle semibold = GoogleFonts.lato(
  fontWeight: FontWeight.w600,
);

TextStyle bold = GoogleFonts.lato(
  fontWeight: FontWeight.w700,
);

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color(0xffFDB846);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);

const Color transparentBlue = Color.fromRGBO(34, 89, 121, 0.651);
const Color blue = Color.fromRGBO(73, 168, 222, 0.651);
// const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}
