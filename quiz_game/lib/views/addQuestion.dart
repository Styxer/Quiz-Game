import 'package:flutter/material.dart';
import 'package:quiz_game/services/database.dart';
import 'package:quiz_game/shared/constants.dart';
import 'package:quiz_game/shared/loading.dart';
import 'package:quiz_game/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {

  final String quizID;
  AddQuestion({this.quizID});

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  final double margin = 36;
  bool isLoading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = DatabaseService();

    uploadQuestionData() async{
      if(_formKey.currentState.validate()){

        setState(() {
          isLoading = true;
        });

        Map<String, String> questionData = {
          "question" : question,
          "option1" :option1,
          "option2" :option2,
          "option3" :option3,
          "option4" :option4,
        };

        await databaseService.addQuestionData(widget.quizID, questionData)
            .then((value){

//          Navigator.pushReplacement(context, MaterialPageRoute(
//              builder: (context) => AddQuestion(
//                quizID: quizID,
//              )));

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

    return Scaffold(
      appBar: mainAppBar(context),
      body: SingleChildScrollView(
        child: isLoading ? Loading() : Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextFormField(
                  validator: (val) => val.isEmpty ? "Question Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Question'),
                  onChanged: (value) => question = value,
                ),
                SizedBox(height: 6,),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Option1 Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Option1(Correct Answer)'),
                  onChanged: (value) => option1 = value,
                ),
                SizedBox(height: 6,),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Option2  Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Option2'),
                  onChanged: (value) => option2 = value,
                ),
                SizedBox(height: 6,),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Option3 Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Option3'),
                  onChanged: (value) => option3 = value,
                ),
                SizedBox(height: 6,),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Option4 Cannot be empty" : null,
                  decoration: textInputDecoration.copyWith(hintText: 'Option4'),
                  onChanged: (value) => option4 = value,
                ),
                SizedBox(height: 160,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: blueButton(
                        context: context,
                        text: "Submit",
                        buttonWidth: MediaQuery.of(context).size.width / 2 - margin),
                    ),
                    SizedBox(width: 24,),
                    GestureDetector(
                      onTap: (){
                        uploadQuestionData();
                      },
                      child: blueButton(
                          context: context,
                          text: "Add Question",
                          buttonWidth: MediaQuery.of(context).size.width / 2 - margin),
                    ),

                  ],
                ),
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
