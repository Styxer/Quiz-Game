import 'package:flutter/material.dart';
import 'package:quiz_game/views/createQuiz.dart';
import 'package:quiz_game/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: Container(
        child: Column(
          children: [
          ],
        ),
      ),
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
