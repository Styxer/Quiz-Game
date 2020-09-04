import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/views/signUp.dart';
import 'package:quiz_game/widgets/widgest.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final double margin = 24;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Email cannot be empty" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val){
                  email = val;
                },
              ),//email
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Password cannot be empty" : null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val){
                  password = val;
                },
              ),//password

              SizedBox(height: 24,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - margin * 2,
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),//sign in btn container
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 15.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context
                          , MaterialPageRoute(
                          builder: (context) => SignUp()
                      )
                      );
                    },
                    child: Text(
                      "Sign Up ",
                      style: TextStyle(
                        fontSize: 15.5,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),



                ],
              ),//sign up

              SizedBox(height: 80,),
            ],
          ),
        ),
      ),
    );//Scaffold
  }
}


