import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle heading = GoogleFonts.montserrat(
      color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 30);

  static TextStyle subHeading = GoogleFonts.montserrat(
      color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle subHeading2 = GoogleFonts.raleway(
      color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 18);

  static TextStyle para = GoogleFonts.raleway(
      color: Colors.deepPurple,
      // fontWeight: FontWeight.bold,
      fontSize: 12);
  static TextStyle paraBlack = GoogleFonts.raleway(
      color: Colors.black,
      // fontWeight: FontWeight.bold,
      fontSize: 12);
}
