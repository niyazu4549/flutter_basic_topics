import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class DatePickerTimeLine extends StatefulWidget {
  const DatePickerTimeLine({super.key});

  @override
  State<DatePickerTimeLine> createState() => _DatePickerTimeLineState();
}

class _DatePickerTimeLineState extends State<DatePickerTimeLine> {
  DateTime _selectedValue= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
        ],
      ),
    );
  }
}
