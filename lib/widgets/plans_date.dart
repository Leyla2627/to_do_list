import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PlansDate extends StatelessWidget {
  final Function function;
  final DateTime markedDay;
  final Function() beforeDate;
  final Function() afterDate;

  PlansDate(this.function, this.markedDay, this.beforeDate, this.afterDate);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          onPressed: beforeDate,
          icon: Icon(Icons.arrow_left, size: 35),
        ),
        TextButton(
          onPressed: () {
            function(context);
          },
          child: RichText(
            text: TextSpan(
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
                children: [
                  TextSpan(
                      text: "${DateFormat.EEEE().format(markedDay)}, ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "${DateFormat("d-MMM").format(markedDay)}"),
                ]),
          ),
        ),
        IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            onPressed: afterDate,
            icon: Icon(
              Icons.arrow_right,
              size: 35,
            )),
      ],
    );
  }
}
