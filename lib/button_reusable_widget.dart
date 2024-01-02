import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/reusable_widgets.dart';
import 'package:flutter_basic_topics/reusable_widgets/mycard_widget.dart';
import 'package:flutter_basic_topics/widgets.dart';

class ButtonReusableWidget extends StatefulWidget {
  const ButtonReusableWidget({super.key});

  @override
  State<ButtonReusableWidget> createState() => _ButtonReusableWidgetState();
}

class _ButtonReusableWidgetState extends State<ButtonReusableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ButtonWidget(title: 'Button1',buttonColor: Colors.deepPurple),
            // const SizedBox(height: 20),
            // ButtonWidget(title: 'Button2',buttonColor: Colors.deepPurple),
            // const SizedBox(height: 20),
            // ButtonWidget(title: 'Button1',buttonColor: Colors.deepPurple),
            // const SizedBox(height: 20),
            // ButtonWidget(title: 'Button1',buttonColor: Colors.deepPurple),
            // const SizedBox(height: 20),
            // ButtonWidget(title: 'Button1',buttonColor: Colors.deepPurple),
            const SizedBox(height: 20),
            CardWidgetBox(title1: 'Shaik Niyazuddin',title2: '5502 9901 2165 1245',title3: '12/2024',cardColor: Colors.orange),
            const SizedBox(height: 20),
            CardWidgetBox(title1: 'Shaik Niyazuddin',title2: '5502 9901 2165 1245',title3: '12/2024',cardColor: Colors.indigo),
            const SizedBox(height: 20),
            CardWidgetBox(title1: 'Shaik Niyazuddin',title2: '5502 9901 2165 1245',title3: '12/2024',cardColor: Colors.green),
          ],
        ),
      ),
    );
  }
}
