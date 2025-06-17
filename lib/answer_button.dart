// for styling the button we made the separte widget for more dynamic control

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

const AnswerButton({
  super.key,
  required this.answerText,  // required keyword used for name arguments which now works like positional argumnets 
  required this.onTap,
  });

final String answerText;
final void  Function () onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
         vertical: 10,
         horizontal: 40
        ),
        backgroundColor: const Color.fromARGB(255, 72, 2, 84),
        foregroundColor: Colors.white,
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(40),
         ),
      ),
      child:  Text(answerText,textAlign: TextAlign.center,),
    );
  }
}
