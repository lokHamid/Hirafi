import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuthService? instance;

  FirebaseAuthService? getInstance(){
    instance ??= FirebaseAuthService();
    return instance;
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;

    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  ///google sign in :
  Future<UserCredential> signInWithGoogle() async{

    try {
      final GoogleSignInAccount? g = await _googleSignIn.signIn();

      if (g == null) throw Exception("Error: operation cancelled!");

      final GoogleSignInAuthentication gAuth = await g.authentication;

      /// create a new cred for the user:
      final creds = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken
      );

      UserCredential userCredential = await _auth.signInWithCredential(creds);
      return userCredential;
    }catch (e) {
      throw "$e";
    }
  }

  ///google sign out:

  Future<void> signOut() async {
    if(await _googleSignIn.isSignedIn()){
      try {
        await _googleSignIn.signOut();
      } catch (e) {
        rethrow;
      }
    }
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }
}