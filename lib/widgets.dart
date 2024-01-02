import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/reusable_widgets.dart';

//Button widget
ButtonWidget({String? title, Color? buttonColor, }){
  return Container(
    height: 20,
    width: 120,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

}

//card widget
CardWidgetBox({String? title1, String? title2, String? title3, Color? cardColor}){
  return SizedBox(
    height: 140,
    width: 500,
    child: Card(
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10,),
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title1!, style: const TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w200),),
          Text(title2!, style: const TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w200),),
          Text(title3!, style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w200),)
        ],
      ),
    ),
  );
}