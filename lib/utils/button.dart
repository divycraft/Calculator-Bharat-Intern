import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  final colol;
  final textcol;
  final String text;
  final buttonTap;
  final wi;
  buttons({ this.colol, this.textcol, required this.text,this.buttonTap, this.wi});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(31),
          child: Container(

            width: wi,
            color: colol,
            child: Center(child: Text(text,style: TextStyle(color: textcol,fontSize: 21),)),
          ),
        ),
      ),
    );
  }
}
