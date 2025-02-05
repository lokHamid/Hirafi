import 'package:hirafi_frontend/models/client.dart';

class Craftsman extends Client{
  String _speciality;
  String _experience;
  Craftsman(super.full_name, super.email, super.password,this._speciality,this._experience);
  
}