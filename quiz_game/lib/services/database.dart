import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  Future<void> addQuizData(String quizID, Map quizData) async{
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizID)
        .set(quizData);

  }

  Future<void> addQuestionData(String quizID,  Map questionData) async {
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc(quizID)
        .collection("QnA")
        .add(questionData);
  }

  getQuizData() async {
    return await FirebaseFirestore.instance
        .collection("quiz")
        .snapshots();
  }

}