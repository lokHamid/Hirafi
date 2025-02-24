import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/client.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Client?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        Map<String, dynamic> map = await fetchClientById(user.uid);
        return Client.fromMap(map);
      } else {
        throw Exception("An Error Occurred During sign-in");
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Client?> signUpWithEmailAndPassword({
    required String fullname,
    required String email,
    required String password,
    required String location,
  }) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        Client client = Client(
          fullName: fullname,
          email: email,
          location: location,
        );
        // Saving user to the clients collection.
        saveClientInfo(client: client,uid: user.uid);
        return client;
      } else {
        throw Exception("Error during sign-up");
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  ///google sign in :
  Future<Client?> signInWithGoogle() async{

    try {
      final GoogleSignInAccount? g = await GoogleSignIn().signIn();

      if (g == null) throw Exception("Error: operation cancelled!");

      final GoogleSignInAuthentication gAuth = await g.authentication;

      /// create a new cred for the user:
      final creds = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken
      );

      UserCredential userCredential = await _auth.signInWithCredential(creds);
      User? user = userCredential.user;

      if(user != null){
        Client client = Client(
          fullName: user.displayName ?? "undefined",
          email: user.email ?? "undefined",
          location: ""
        );
        saveClientInfo(client: client, uid: user.uid);
        return client;
      }else{
        throw Exception("An Error Occurred! Please try again later!");
      }
    }catch (e) {
      throw "An Error Occurred : $e";
    }
  }

  ///google sign out:
  Future<void> signOutFromGoogle() async{
    await GoogleSignIn().signOut();
  }

  Future<Map<String, dynamic>> fetchClientById(String docId) async {
    DocumentSnapshot doc = await _firestore.collection('clients').doc(docId).get();

    try {
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        throw Exception("Error Fetching User Data.");
      }
    } catch (e) {
      throw "Error fetching client data: $e";
    }
  }

  Future<void> saveClientInfo({required Client client,required String uid})async{
    await _firestore.collection("clients").doc(uid).set(client.toMap());
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }
}