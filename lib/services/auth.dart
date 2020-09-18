import 'package:firebase_auth/firebase_auth.dart';
import 'package:recon_subsea_app/models/user.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){

    return(user!=null)? User(uid:user.uid) : null;

  }

  //sign in anon

  Stream<User> get user{
    return(_auth.onAuthStateChanged.map(_userFromFirebaseUser));
  }

  //signin with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return(_userFromFirebaseUser(user));
    }
    catch(e){
      print(e.toString());
      return(null);

    }
  }



  //register with email and password

  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;

      //create a document for the new user
      //await DataBaseService(uid:user.uid).updateUserDate('0', 'New Member',100);

      return(_userFromFirebaseUser(user));
    }
    catch(e){
      print(e.toString());
      return(null);

    }
  }

  //signout

  Future signOut() async{
    try{
      print("SIGNEDDD OUTTT");
      return await _auth.signOut();

  }
  catch(e){
      print(e.toString());
      return(null);
  }
}
}