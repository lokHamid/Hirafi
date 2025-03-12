import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String _fullName;
  String _email;
  GeoPoint? _location;
  String _uid;

  // Constructor with named params
  Client({
    required String fullName,
    required String email,
    required GeoPoint? location,
    required String uid,
  })  : _fullName = fullName,
        _email = email,
        _location = location,
        _uid = uid;

  String get fullName => _fullName;
  String get email => _email;
  GeoPoint? get location => _location;
  String get uid => _uid;

  set fullName(String name) {
    _fullName = name;
  }

  set email(String newEmail) {
    _email = newEmail;
  }

  set location(GeoPoint? newLocation) {
    _location = newLocation;
  }

  set uid(String uid) {
    _uid = uid;
  }

  // convert client object to map
  Map<String, dynamic> toMap() {
    return {
      'fullName': _fullName,
      'email': _email,
      'location': _location,
      'uid': _uid,
    };
  }

  // Factory construct  to build from map
  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      fullName: map['fullName'],
      email: map['email'],
      location: map['location'],
      uid: map['uid'],
    );
  }
}
