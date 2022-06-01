import 'package:arcore_flutter_plugin_example/widgets/animated_button_widget/animated_button_widget.dart';
import 'package:flutter/material.dart';

Widget borderSetting({Widget child, String text, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 10,offset:Offset(2,3),
                      color: Colors.black54
                  )],
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xff508ced),width: 2)),
              child: child),
          SizedBox(height: 5,),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}