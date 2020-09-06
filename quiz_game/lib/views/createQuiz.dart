import 'package:flutter/material.dart';
import 'package:quiz_game/services/database.dart';
import 'package:quiz_game/shared/constants.dart';
import 'package:quiz_game/shared/loading.dart';
import 'package:quiz_game/views/addQuestion.dart';
import 'package:quiz_game/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  final String quidID;


  CreateQuiz({this.quidID});

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription;
  String error = '';
  String quizID;
  DatabaseService _databaseService = DatabaseService();
  bool isLoading = false;



  createQuiz() async{
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      quizID = randomAlphaNumeric(16);
      Map<String, String> quizData = {
        'quizID': quizID,
        'quizImgUrl' : quizImageUrl,
        'quizTitle' : quizTitle,
        'quizDescription' : quizDescription,
      };
      
     await _databaseService.addQuizData(quizID, quizData)
         .then((value){

       Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context) => AddQuestion(
              quizID: quizID,
           )));

     }).catchError((err){
       setState(() {
         error = err.toString();
       });
     });

      setState(() {
        isLoading= false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: isLoading ? Loading() : Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextFormField(
                  validator: (val) => val.isEmpty ? "Image Url Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Quiz Image Url'),
                  onChanged: (value) => quizImageUrl = value,
                ),
                SizedBox(height: 6,),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Quiz Title Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Quiz Title'),
                  onChanged: (value) => quizTitle = value,
                ),
                SizedBox(height: 6,),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Quiz Description  Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Quiz Description'),
                  onChanged: (value) => quizDescription = value,
                ),
                SizedBox(height: 6,),
               // Spacer(),
                GestureDetector(
                  onTap: (){
                    createQuiz();
                  },
                  child: blueButton(context : context, text : "Create Quiz")),
                SizedBox(height: 12,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 60,),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
