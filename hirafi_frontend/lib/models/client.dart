class Client {
  String _fullName;
  String _email;
  String _location;

  // Constructor with named params
  Client({
    required String fullName,
    required String email,
    required String location,
  })  : _fullName = fullName,
        _email = email,
        _location = location;

  String get fullName => _fullName;
  String get email => _email;
  String get location => _location;

  set fullName(String name) {
    _fullName = name;
  }

  set email(String newEmail) {
    _email = newEmail;
  }

  set location(String newLocation) {
    _location = newLocation;
  }

  // Convert Client object to a Map
  Map<String, dynamic> toMap() {
    return {
      'fullName': _fullName,
      'email': _email,
      'location': _location,
    };
  }
  //factory construct to build from map:
  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      fullName: map['fullName'],
      email: map['email'],
      location: map['location'],
    );
  }
}