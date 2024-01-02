import 'package:flutter/material.dart';

//ButtonWidget
class ButtonWidget extends StatelessWidget {
  ButtonWidget({required this.title, required this.buttonColor, super.key});

  String title;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
      ),
    );
  }
}

//MainText
mainText(String? mainTextName,Color? mainTextColor){
  return Text(mainTextName!,style: TextStyle(color: mainTextColor,fontSize: 22,fontWeight: FontWeight.bold),);
}

//Root Text
rootTextWidget(String? mainMenu, String? subMenu,Color? rootTextColor){
return Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(mainMenu!,style: TextStyle(color: rootTextColor,fontSize: 16),),
    ),
    const SizedBox(width: 10),
    const Icon(Icons.arrow_forward_ios,size: 10),
    const SizedBox(width: 10),
    Text(subMenu!,style: TextStyle(color: rootTextColor,fontSize: 12),),
  ],
);
}

//CardWidget

class CardWidget extends StatelessWidget {
    CardWidget({
     required this.cardText,
     required this.cardColor,
     required this.cardNumber,
    super.key});
   Color? cardColor;
       String cardText;
   String cardNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 80,
        width: 250,
        child: const Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            children: [
              // Text(cardText,style: TextStyle(color: cardColor,fontSize: 12,fontWeight: FontWeight.bold),),
              // Text(cardNumber,style: TextStyle(color: cardColor,fontSize: 14,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}

