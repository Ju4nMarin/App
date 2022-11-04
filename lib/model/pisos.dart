import 'package:firebase_database/firebase_database.dart';

class Pisos {
  String? _id;
  String? _horario;
  String? _nombre;
  String? _piso;
  String? _sala;
  String? _qr;

  Pisos(
      this._id, this._horario, this._nombre, this._piso, this._sala, this._qr);

  Pisos.map(dynamic obj) {
    this._horario = obj['horario'];
    this._nombre = obj['nombre'];
    this._piso = obj['piso'];
    this._sala = obj['sala'];
    this._qr = obj['qr'];
  }

  String? get id => _id;
  String? get horario => _horario;
  String? get nombre => _nombre;
  String? get piso => _piso;
  String? get sala => _sala;
  String? get qr => _qr;

  Pisos.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _horario = snapshot.value as String?;
    _nombre = snapshot.value as String?;
    _piso = snapshot.value as String?;
    _sala = snapshot.value as String?;
    _qr = snapshot.value as String?;
  }
}
