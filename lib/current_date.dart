import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/utiles/colors.dart';
import 'package:flutter_basic_topics/utiles/constants.dart';
import 'package:intl/intl.dart';

class ShowCurrentDate extends StatefulWidget {
  const ShowCurrentDate({super.key});

  @override
  State<ShowCurrentDate> createState() => _ShowCurrentDateState();
}

class _ShowCurrentDateState extends State<ShowCurrentDate> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            left: 30, right: 15, bottom: 5, top: 20),
        child: Text(
          plantReportOnDate,
          style: const TextStyle(
              color: black, fontSize: 21),
        ),
      ),
    );
  }
}
