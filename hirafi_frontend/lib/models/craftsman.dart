import 'package:hirafi_frontend/models/client.dart';

class Craftsman extends Client {
  String _speciality;
  String _experience;
  String _about;
  double _rating;

  // Constructor with named parameters
  Craftsman({
    required super.fullName,
    required super.email,
    required super.location,
    required super.uid,
    required String speciality,
    required String experience,
    required String about,
    required double rating
  })  : _speciality = speciality,
        _experience = experience,
        _about = about,
        _rating = rating;

  Craftsman.fromClient({
    required Client client,
    required String speciality,
    required String experience,
    required String about,
    required double rating,
  })  : _speciality = speciality,
        _experience = experience,
        _about = about,
        _rating = rating,
        super(
        fullName: client.fullName,
        email: client.email,
        location: client.location,
        uid: client.uid,
      );

  // Getters
  String get speciality => _speciality;
  String get experience => _experience;
  String get about => _about;
  double get rating => _rating;

  // Setters (Optional)
  set speciality(String newSpeciality) {
      _speciality = newSpeciality;
  }

  set experience(String newExperience) {
      _experience = newExperience;
  }

  set about(String newAbout) {
      _about = newAbout;
  }

  set rating(double rating){
    _rating = rating;
  }

  @override
  Map<String, dynamic> toMap() {
    // Get the map from the parent class (Client)
    final Map<String, dynamic> clientMap = super.toMap();

    // Add Craftsman-specific properties
    clientMap.addAll({
      'speciality': _speciality,
      'experience': _experience,
      'about': _about,
      'rating': _rating,
    });

    return clientMap;
  }

  factory Craftsman.fromMap(Map<String, dynamic> map) {
    return Craftsman(
      fullName: map['fullName'],
      email: map['email'],
      location: map['location'],
      uid: map['uid'],
      speciality: map['speciality'],
      experience: map['experience'],
      about: map['about'],
      rating: map['rating'],
    );
  }
}
