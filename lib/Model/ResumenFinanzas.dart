class ResumenFinanzas {
final String _ingresos, _salidas, _caja;
  
  ResumenFinanzas(this._ingresos,this._salidas, this._caja);

  factory ResumenFinanzas.fromJson(dynamic json) {
    return ResumenFinanzas(
      json['INGRESOS'] as String,
      json['SALIDAS'] as String,
      json['CAJA'] as String,
    );
  }

  String getIngresos() {
    return this._ingresos;
  }
  String getSalidas() {
    return this._salidas;
  }
  String getCaja() {
    return this._caja;
  }
}