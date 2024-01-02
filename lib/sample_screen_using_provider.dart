import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/provider_class.dart';
import 'package:provider/provider.dart';

class SampleScreenUsingProvider extends StatefulWidget {
  const SampleScreenUsingProvider({super.key});

  @override
  State<SampleScreenUsingProvider> createState() =>
      _SampleScreenUsingProviderState();
}

class _SampleScreenUsingProviderState extends State<SampleScreenUsingProvider> {
  List<String> providerList = ["Container1", "Container2", "Container3"];

  @override
  Widget build(BuildContext context) {
    print("Rebuild Starts");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Provider State Management"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.yellow,
            child: const Center(child: Text("Yellow Container")),
          ),
          const SizedBox(height: 20),
          Consumer<MyProvider>(builder: (context, data, Widget? child) {
            return const Column(
              children: [
                Text("Yellow Container1"),
                SizedBox(height: 15),
                Text("Yellow Container2"),
                SizedBox(height: 15),
                Text("Yellow Container3"),
              ],
            );
          })
        ],
      ),
    );
  }
}
