import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Dummy data
  final _myList = List.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Scrollbar(
        // I use a big thickness to make the thumb is easy to be seen
        // You should chose another number that makes more sense
        thickness: 10,
        thumbVisibility: true,
        radius: const Radius.circular(10), // give the thumb rounded corners
        child: ListView.builder(
          itemCount: _myList.length, // Don't forget this line
          itemBuilder: (context, index) => Card(
            key: ValueKey(_myList[index]),
            margin: const EdgeInsets.all(15),
            elevation: 5,
            color: Colors.accents[Random().nextInt(Colors.accents.length)],
            child: ListTile(
              title: Text(
                _myList[index],
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}