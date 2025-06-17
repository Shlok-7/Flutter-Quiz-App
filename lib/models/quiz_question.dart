// data model file not a widget to hold all the data of the quiz 
//blueprint of the data for questions objects


class QuizQuestion {
const QuizQuestion(this.text,this.answers);// constructor function

  final String text;
  final List<String> answers; // list of answers to display more than one options 

   List<String>getShuffledAnswers(){
    final shuffledList=List.of(answers);// first create a copy of the og answers 
    shuffledList.shuffle();  //  calls the shuffles and shuffling the answers
    return shuffledList;
    
   }


}