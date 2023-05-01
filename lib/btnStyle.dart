import 'package:flutter/material.dart';

class BTN extends StatelessWidget {
String txt;
Color ?color;
Function onpress;
BTN(this.txt,this.onpress,{this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
       child: ElevatedButton(
         style: ElevatedButton.styleFrom(
           backgroundColor: color,
           foregroundColor: Colors.tealAccent
         ),
              onPressed: (){onpress(
                txt
              );}, child: Text(txt,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),

    );
  }
}
