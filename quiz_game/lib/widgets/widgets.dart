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
    centerTitle: true,
  );
}


  Widget blueButton(BuildContext context, String s) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - margin * 2,
      child: Text(
        s,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }