//Stateful Widget 
import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

// 2nd method for rendering the content of the screen using init method 
// Widget? activeScreen;// by adding ? we tell the activeScreen can also be null

// //initState(): Executed by Flutter when the StatefulWidget's State object is initialized
// @override     
//   void initState() {
//     activeScreen=StartScreen(switchScreen);// we passed thr switch Screen function to the StartScreen widget
//     super.initState();
//   }

// void switchScreen(){
//   setState((){
//     activeScreen=const QuestionsScreen();
//   }) ;
// }



//build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called

  @override
  Widget build(context) {

     // used to check the condtion of the activeScreen and render the content of the screen accordingly

    //using ternary operator
    // final screenWidget=activeScreen=='start-screen' // condition returns true or false 
    //           ? StartScreen(switchScreen) // value if it is true 
    //           : const QuestionsScreen();  // value if it is false 
    
     // OR 
     
    //using if statement 

    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child:  activeScreen, // used during init method which is the scond approach
          child: screenWidget,
        ),
      ),
    );
  }
}