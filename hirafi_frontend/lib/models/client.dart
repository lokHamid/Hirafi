class Client{
  String _full_name;
  String _email;
  String _password;
  String _location;

  get fullname => _full_name;
  get email => _email;
  get password => _password;
  get loc => _location;

  Client(this._full_name,this._email,this._password,this._location);

}