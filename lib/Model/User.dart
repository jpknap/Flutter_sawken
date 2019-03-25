class  User  {
  final String _nombre, _apellido1, _apellido2, _token, _email;  

  User(this._email,this._nombre, this._apellido1, this._apellido2, this._token);

  String getTokenUser() {
    return this._token;
  }
  String getFullName(){
    return '${this._nombre} ${this._apellido1}';
  }

  factory User.fromJson(dynamic json) {
    return User(
       json['EMAIL'] as String,
       json['NOMBRE'] as String,
       json['APELLIDO'] as String,
       json['APELLIDO2'] as String,
       json['TOKEN'] as String,
    );
  }

}