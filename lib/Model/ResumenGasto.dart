class ResumenGasto {
final String _usuarioNombre, _usuarioApellido, _monto, _resumenCompra, _comentarioCompra, _transaccionFecha;
  
  ResumenGasto(this._usuarioNombre, this._usuarioApellido, this._monto,
   this._resumenCompra, this._transaccionFecha, this._comentarioCompra);

   String getFullname(){
     String _fullname = this._usuarioNombre+' '+_usuarioApellido;
     return _fullname;
   }
   String fechaTransaccion(){
     return this._transaccionFecha;
   }
   String monto(){
     return this._monto;
   }
   String resumenCompra(){
     return this._resumenCompra;
   }
   String comentarioCompra(){
     return this._comentarioCompra;
   }

  factory ResumenGasto.fromJson(dynamic json) {
    return ResumenGasto(
      json['USUARIO_NOMBRE'] as String,
      json['USUARIO_APELLIDO'] as String,
      json['MONTO'] as String,
      json['RESUMEN'] as String,
      json['FECHA_TRANSACCION'] as String,
      json['COMENTARIO'] as String
    );
  }
}