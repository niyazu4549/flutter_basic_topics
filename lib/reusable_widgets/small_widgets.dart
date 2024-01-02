import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/utiles/colors.dart';

//viewall widget
// ignore: must_be_immutable
class ViewAllWidget extends StatelessWidget {
  ViewAllWidget({super.key, required this.textName, required this.ontap});

  String textName;
  VoidCallback ontap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 310, top: 20),
        child: Text(
          textName,
          style: const TextStyle(fontSize: 12, fontFamily: 'Medium'),
        ),
      ),
    );
  }
}

//textfieldname
class TextFieldName extends StatelessWidget {
  TextFieldName({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 22, fontFamily: 'Medium', color: Colors.black),
      ),
    );
  }
}

//button widget
class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    required this.name,
    required this.buttonColor,
    // required this.buttonWidth,
    super.key,
  });

  String name;
  Color? buttonColor;

  // double? buttonWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 40,
      width: 165,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Bold', fontSize: 16),
        ),
      ),
    );
  }
}

//root name of every screen
buildRootName({String? menuName, String? submenuName}) {
  return Row(
    children: [
      Text(
        menuName!,
        style: const TextStyle(fontSize: 13, fontFamily: 'Bold', color: grey2),
      ),
      Text(
        submenuName!,
        style: const TextStyle(
            fontSize: 13, fontFamily: 'Bold', color: blackColorShade1),
      ),
    ],
  );
}

//list of plants table headings
listMainTitle({
  String? title,
}) {
  return Text(title!,
      style: const TextStyle(
          color: blackShade, fontFamily: 'Medium', fontSize: 16));
}

//filter icons
filterIcons() {
  return Container(
    height: 12,
    width: 9,
    child: Image.asset("assets/images/filter_icon.png"),
  );
}

//list body text
listBodyTextStyle() {
  return const TextStyle(
      fontSize: 12, fontFamily: 'Regular', color: blackColorShade1);
}
