import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  Future<void> addQuizData(String quizID, Map quizData) async{

    await FirebaseFirestore.instance.collection("quiz")
        .doc(quizID)
        .set(quizData)
        .catchError((e) {
          print(e.toString());
    });
  }

}