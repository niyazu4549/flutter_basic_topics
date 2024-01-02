import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/utiles/colors.dart';

class MyCardWidget extends StatelessWidget {
  MyCardWidget(
      {super.key,
      required this.cardName,
      this.cardValue,
      required this.iconImage,
      required this.bottomText});

  String cardName;
  String? cardValue;
  dynamic iconImage;
  String bottomText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
        right: 15,
      ),
      padding: const EdgeInsets.only(right: 15),
      height: 145,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(color: shadowColor),
          BoxShadow(
              blurRadius: 30,
              color: Colors.white,
              spreadRadius: 0,
              offset: Offset(18, 18))
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 12, left: 24),
                  child: Text(
                    cardName,
                    style: const TextStyle(
                        fontSize: 20, color: fontColor, fontFamily: 'SemiBold'),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 12, left: 0),
                height: 54,
                width: 54,
                decoration: const BoxDecoration(
                    color: iconconColor, shape: BoxShape.circle),
                child: Image.asset(iconImage),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(left: 261, top: 20),
              child: Text(
                cardValue!,
                style: const TextStyle(
                    fontSize: 20, color: fontColor, fontFamily: 'SemiBold'),
              )),
          Container(
              margin: const EdgeInsets.only(left: 140, top: 5),
              child: Text(
                bottomText,
                style: const TextStyle(
                    color: grey1, fontSize: 16, fontFamily: 'SemiBold'),
              )),
        ],
      ),
    );
  }
}
