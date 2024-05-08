import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createAcount(String email, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      print(userCredential.user);
      return (userCredential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak");
        return 1;
      } else if (e.code == "email-already-in-use") {
        print("The account already ecist for that email");
        return 2;
      }
    } catch (e) {
      print(e);
    }
  }

  Future singInEmailAnsPassword(String email, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      final a = userCredential.user;
      if (a?.uid != null) {
        return a?.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return 1;
      } else if (e.code == "wrong-password") {
        return 2;
      }
    }
  }
}
