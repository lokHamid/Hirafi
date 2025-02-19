import 'package:hirafi_frontend/models/client.dart';

class Craftsman extends Client{
  String _speciality;
  String _experience;
  String _about;

  get spec => _speciality;
  get exp => _experience;
  Craftsman(super.full_name, super.email, super.password,super.location,this._speciality,this._experience,this._about);
  
}