import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String _fullName;
  String _email;
  String _uid;

  // Constructor with named params
  Client({
    required String fullName,
    required String email,
    required String uid,
  })  : _fullName = fullName,
        _email = email,
        _uid = uid;

  String get fullName => _fullName;
  String get email => _email;
  String get uid => _uid;

  set fullName(String name) {
    _fullName = name;
  }

  set email(String newEmail) {
    _email = newEmail;
  }

  set uid(String uid) {
    _uid = uid;
  }

  // convert client object to map
  Map<String, dynamic> toMap() {
    return {
      'fullName': _fullName,
      'email': _email,
      'uid': _uid,
    };
  }

  // Factory construct  to build from map
  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      fullName: map['fullName'],
      email: map['email'],
      uid: map['uid'],
    );
  }
}
