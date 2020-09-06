import 'package:flutter/material.dart';

final double margin = 24;

Widget appBar(BuildContext context){
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: <TextSpan>[
        TextSpan(
            text: 'Quiz',
            style: TextStyle(
              letterSpacing: 2,
                fontWeight: FontWeight.w600
                , color: Colors.black54)),
        TextSpan(
            text: 'Maker',
            style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.w600
                , color: Colors.blue[600])),
      ],
    ),
  );
}

Widget mainAppBar(BuildContext context) {
  return AppBar(
    title: appBar(context),
    backgroundColor: Colors.transparent,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color : Colors.black87),
    centerTitle: true,
  );
}


  Widget blueButton({BuildContext context, String text,double buttonWidth}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      width: buttonWidth != null ? buttonWidth : MediaQuery.of(context).size.width - margin * 2,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }