import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_game/Models/customUser.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _userFromFirebaseUser(User user){
    return user != null ? CustomUser(userId:  user.uid) : null;
  }

  //sign in with email and password
  Future signInEmailAndPassword(String email, String password) async{

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);


  }

  //sign up with email and password
  Future signUpEmailAndPassword(String email, String password) async{

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);


  }

  //sign out
  Future signOut() async {
      return await _auth.signOut();

  }

}