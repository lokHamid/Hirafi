import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/providers/providers.dart';
import 'package:hirafi_frontend/services/firebase_auth_service.dart';

import '../models/client.dart';

class ClientService{
  final FirebaseAuthService? _authService = FirebaseAuthService().getInstance();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ClientService() : super();

  //methods that query the document directly.

  Future<Map<String, dynamic>?> fetchClientById(String docId) async {
    DocumentSnapshot doc = await _firestore.collection('clients').doc(docId).get();

    try {
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      throw "Error fetching client data: $e";
    }
  }

  Future<void> saveClientInfo({required Client client,required String uid})async{
    await _firestore.collection("clients").doc(uid).set(client.toMap());
  }

}