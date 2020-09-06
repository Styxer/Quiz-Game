import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/Models/customUser.dart';
import 'package:quiz_game/services/auth.dart';
import 'package:quiz_game/shared/constants.dart';
import 'package:quiz_game/shared/loading.dart';
import 'package:quiz_game/views/home.dart';
import 'package:quiz_game/views/signUp.dart';
import 'package:quiz_game/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final double margin = 24;
  String email, password, error = '';

  bool isLoading = false;


  signIn() async{
    if(_formKey.currentState.validate()){
      AuthService authService = AuthService();
      setState(() {
        isLoading = true;
      });
      await authService.signInEmailAndPassword(email, password)
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
      appBar: mainAppBar(context),
      body:  isLoading ? Loading() : Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: margin),
            child: Column(
              children: [
               //Spacer(),
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
                  onTap: () async {
                    await signIn();
                  },
                  child: blueButton(context:  context, text: 'sign in'),
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
      ),
    );//Scaffold
  }


}





