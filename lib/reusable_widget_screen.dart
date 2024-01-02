import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/reusable_widgets.dart';

class ReusableWidgetScreen extends StatefulWidget {
  const ReusableWidgetScreen({super.key});

  @override
  State<ReusableWidgetScreen> createState() => _ReusableWidgetScreenState();
}

class _ReusableWidgetScreenState extends State<ReusableWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            rootTextWidget("Config", "Elevated Buttons", Colors.red),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               mainText("Elevated Buttons",Colors.cyan),
                mainText("Elevated Buttons",Colors.orange),
                mainText("Elevated Buttons",Colors.blue),
                mainText("Elevated Buttons",Colors.green),

              ],
            ),
            const SizedBox(height: 20),
            ButtonWidget(title: "Click Here", buttonColor: Colors.orange),
            const SizedBox(height: 20),
            ButtonWidget(title: "Click Here", buttonColor: Colors.blue),
            const SizedBox(height: 20),
            ButtonWidget(title: "Click Here", buttonColor: Colors.green),
            const SizedBox(height: 20),
            ButtonWidget(title: "Click Here", buttonColor: Colors.lightGreenAccent),
          ],
        ),
      ),
    );
  }
}
