import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_game/Models/customUser.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _userFromFirebaseUser(User user){
    return user != null ? CustomUser(userId:  user.uid) : null;
  }

  //sign in with email and password
  Future signInEmailAndPassword(String email, String password) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);

    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }

  //sign up with email and password
  Future signUpEmailAndPassword(String email, String password) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);

    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }

}