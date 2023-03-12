import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

Widget listtile(context, id, name, time, guess, point) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
    width: MediaQuery.of(context).size.width * 0.5 - 20,
    decoration: BoxDecoration(
        border: const GradientBoxBorder(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.red, Colors.yellow]),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5)),
    child: Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            "$id",
            style: TextStyle(fontFamily: 'gothambold', fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "$name",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: 'gothammedium', fontSize: 30),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "$time",
              style: TextStyle(fontFamily: 'gothammedium', fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "$guess",
              style: TextStyle(fontFamily: 'gothammedium', fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "$point",
              style: TextStyle(fontFamily: 'gothammedium', fontSize: 30),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget listtileHeading(context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    width: MediaQuery.of(context).size.width * 0.5,
    child: Row(
      children: [
        Text(
          "  ",
          style: TextStyle(fontFamily: 'gothambold', fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "NAME",
            style: TextStyle(fontFamily: 'gothambold', fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "TIME",
              style: TextStyle(fontFamily: 'gothambold', fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "GUESSES",
              style: TextStyle(fontFamily: 'gothambold', fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "POINTS ",
              style: TextStyle(fontFamily: 'gothambold', fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}
