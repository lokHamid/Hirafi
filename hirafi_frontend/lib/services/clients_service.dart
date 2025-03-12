import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hirafi_frontend/models/craftsman.dart';
import 'package:hirafi_frontend/services/firebase_auth_service.dart';

import '../models/client.dart';

class ClientService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ClientService() : super();

  //methods that query the document directly.

  Future<Map<String, dynamic>?> fetchUserById(String docId) async {
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

  Future<void> saveClientInfo({required dynamic client}) async {
    try{
      if(client is Client || client is Craftsman){
        await _firestore.collection("clients").doc(client.uid).set(client.toMap());
      }else{
        throw Exception("Invalid User Type! Only Craftsman and Client types are permissible");
      }
    }catch(e){
      throw Exception("Error saving user: $e");
    }
    
  }

}