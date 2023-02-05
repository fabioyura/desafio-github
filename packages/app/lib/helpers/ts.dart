import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ts {
  TextStyle title = GoogleFonts.openSans(
    color: const Color.fromARGB(255, 13, 81, 16),
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  TextStyle body = GoogleFonts.openSans(
    color: Colors.black,
    fontSize: 14,
  );

  TextStyle icon = GoogleFonts.openSans(
    color: Colors.amber,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  TextStyle user = GoogleFonts.openSans(
    color: const Color.fromARGB(255, 13, 81, 16),
    fontSize: 12,
  );
}

late Ts ts;
