import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({this.text, this.color, this.onTap});

  final String text;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text.tr.toUpperCase(),
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
