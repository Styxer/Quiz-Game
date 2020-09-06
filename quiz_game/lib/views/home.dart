import 'package:flutter/material.dart';
import 'package:quiz_game/services/database.dart';
import 'package:quiz_game/views/createQuiz.dart';
import 'package:quiz_game/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final double margin = 24;

  Stream quizData;
  DatabaseService databaseService = DatabaseService();


  Widget quizList(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: StreamBuilder(
        stream: quizData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data == null
              ? Container(
            child: Text("meow"),
          ):
              ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){
                    return QuizTile(
                      imgUrl: snapshot.data.documents[index].get("quizImgUrl"),
                      desc: snapshot.data.documents[index].get("quizDescription"),
                      title: snapshot.data.documents[index].get("quizTitle"),
                    );


                  });
        },
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQuizData().then((val) {
      setState(() {
        quizData = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => CreateQuiz()));
        },
      ),
    );


  }
}

class QuizTile extends StatelessWidget {

  final String  imgUrl, title, desc;


  QuizTile({
    @required this.imgUrl,
    @required this.title,
    @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 150,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              width: MediaQuery.of(context).size.width - margin * 2,
              fit: BoxFit.fill,

            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black26,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6,),
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

