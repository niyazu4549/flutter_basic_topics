import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizedBoxWidget extends StatefulWidget {
  const SizedBoxWidget({super.key});

  @override
  State<SizedBoxWidget> createState() => _SizedBoxWidgetState();
}

class _SizedBoxWidgetState extends State<SizedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SizedBox",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Container(
              height: 100,
              width: 100,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.indigo,
            ),
            const SizedBox(height: 10,),
            Container(
              height: 100,
              width: 100,
              color: Colors.green,
            )
          ],
        ),
      )
    );
  }
}
