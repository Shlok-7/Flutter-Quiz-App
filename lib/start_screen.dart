//custom widget usied for Screen to start and to display the elements in it 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{

   const StartScreen(this.startQuiz,{super.key});// constructor function
  
  // startQuiz function is used to start the quiz and points to the quiz.dart file 
  final void Function() startQuiz;// variable to hold the function to start the quiz

  @override
  //image Widget 
   Widget build(context){
    return  Center(
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Image.asset('assets/images/quiz-logo.png',
           width:300,
           color:const Color.fromARGB(150, 255, 255, 255),
           ),
        //  Opacity(
        //   opacity: 0.5,
        //    child: Image.asset('assets/images/quiz-logo.png',
        //    width:300,
        //           ),
        //  ),

       const SizedBox(height: 80),
      
      //Text Widget
        Text('Learn Flutter the Fun way!',
      style:GoogleFonts.lato(
        color:const Color.fromARGB(255, 237, 223, 252),
        fontSize:24
      ),
      ),

      const SizedBox(height: 30),
      
      //Button Widget
      OutlinedButton.icon(
        onPressed:(){
          startQuiz();
        },
       style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
       ),
       icon:const Icon(Icons.arrow_right_alt) ,
       label: const Text('Start QUiz'),
       )
    ],
    ) ,
    );
   }
}