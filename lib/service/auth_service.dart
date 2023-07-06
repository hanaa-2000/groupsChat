import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groups_chat/service/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login

//Register
  Future registerUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if(user !=null){
        await DataBasService(userId: user.uid).updateUserData(fullName, email);
        return true ;
      }
    } on FirebaseException catch (e) {
      print(e);
      return e.message;
    }
  }

//sign out
}
