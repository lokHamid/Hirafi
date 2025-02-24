import 'package:hirafi_frontend/models/client.dart';

class Craftsman extends Client {
  String _speciality;
  String _experience;
  String _about;

  // Constructor with named parameters
  Craftsman({
    required super.fullName,
    required super.email,
    required super.location,
    required String speciality,
    required String experience,
    required String about,
  })  : _speciality = speciality,
        _experience = experience,
        _about = about;

  // Getters
  String get speciality => _speciality;
  String get experience => _experience;
  String get about => _about;

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
}
