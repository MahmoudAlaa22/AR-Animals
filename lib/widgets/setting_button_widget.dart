import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget(
      {this.text, this.color, this.onTap, this.width = double.infinity,
      this.paddingHorizontal=0,this.paddingVertical=15,
        this.height,this.selected=false
      });

  final String text;
  final Color color;
  final Function onTap;
  final double width;
  final double height;
  final double paddingVertical;
  final double paddingHorizontal;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: paddingVertical,horizontal:paddingHorizontal ),
        width: width,
        height:height ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color:!selected?Colors.transparent:Colors.white,width: 2)
        ),
        child: AutoSizeText(
          text.tr.capitalizeFirst,
          style: TextStyle(fontSize:30,fontWeight: FontWeight.bold, color: Colors.white),
          minFontSize: 20,
          maxFontSize: 30,
        ),
      ),
    );
  }
}
