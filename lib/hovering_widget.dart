import 'package:flutter/material.dart';


class HoveringWidget extends StatefulWidget {
  const HoveringWidget({super.key});

  @override
  State<HoveringWidget> createState() => _HoveringWidgetState();
}

class _HoveringWidgetState extends State<HoveringWidget> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {

          },
          onHover: (hovering) {
            setState(() => isHovering = hovering);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isHovering ? Colors.indigoAccent : Colors.pink,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Hi, Niyazu!',
              style: TextStyle(fontSize: 90, color: isHovering ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
