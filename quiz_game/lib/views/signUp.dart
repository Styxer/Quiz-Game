import 'package:flutter/material.dart';
import 'package:quiz_game/Models/customUser.dart';
import 'package:quiz_game/services/auth.dart';
import 'package:quiz_game/shared/constants.dart';
import 'package:quiz_game/shared/loading.dart';
import 'package:quiz_game/views/home.dart';
import 'package:quiz_game/views/signIn.dart';
import 'package:quiz_game/widgets/widgest.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  final double margin = 24;
  String name, email, password , error = '';
  bool isLoading = false;

  signUp() async{
    if(_formKey.currentState.validate()){
      AuthService authService = AuthService();
      setState(() {
        isLoading = true;
      });
      await authService.signUpEmailAndPassword(email, password)
          .then((value){
        //print('me $value');
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Home()));

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
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: isLoading ? Loading() : Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Name cannot be empty" : null;
                },
                decoration: textInputDecoration.copyWith(hintText: 'Name'),
                onChanged: (val){
                  name = val;
                },
              ),//Name
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Email cannot be empty" : null;
                },
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val){
                  email = val;
                },
              ),//email
              SizedBox(height: 6,),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.isEmpty ? "Password cannot be empty" : null;
                },
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                onChanged: (val){
                  password = val;
                },
              ),//password

              SizedBox(height: 24,),
              GestureDetector(
                onTap: () {
                  signUp();
                },//btn sign up logic
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - margin * 2,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),//sign in btn container
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 15.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context
                          , MaterialPageRoute(
                          builder: (context) => SignIn()
                        )
                      );
                    },
                    child: Text(
                      "Sign In ",
                      style: TextStyle(
                        fontSize: 15.5,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),



                ],
              ),//sign up


              SizedBox(height: 12,),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 80,),
            ],
          ),
        ),
      ),
    );//Scaffold
  }
}
