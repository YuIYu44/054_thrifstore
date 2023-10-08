import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void navigateToNext(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

AppBar AppBar_(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: MediaQuery.of(context).size.width * 0.2,
    title: Image.asset(
      "asset/logo.png",
      width: MediaQuery.of(context).size.width * 0.4,
    ),
  );
}

Widget orangeButton(BuildContext context, VoidCallback onPressed, String texts,
    num tops, bottoms, lefts, rights) {
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * tops,
      bottom: MediaQuery.of(context).size.height * bottoms,
      left: MediaQuery.of(context).size.width * lefts,
      right: MediaQuery.of(context).size.width * rights,
    ),
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0XffFFD600),
        shape: BeveledRectangleBorder(),
        side: BorderSide(width: 2.0, color: Color(0XffFFE86C)),
      ),
      child: Text(
        texts,
        textAlign: TextAlign.center,
        style: GoogleFonts.inika(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
