class ResumenTransaccion {
final String usuarioNombre, usuarioApellido, cantidadBotellas, recaudado,comentario, transaccionFecha,
 cervezaNombre, cervezaEstilo, transaccionTipo;
  
  ResumenTransaccion({this.usuarioNombre, this.usuarioApellido, this.cantidadBotellas, this.recaudado,
   this.comentario, this.transaccionFecha, this.cervezaNombre,this.cervezaEstilo, this.transaccionTipo});

  factory ResumenTransaccion.fromJson(dynamic json) {
    return ResumenTransaccion(
      usuarioNombre: json['USUARIO_NOMBRE'] as String,
      usuarioApellido: json['USUARIO_APELLIDO'] as String,
      cantidadBotellas: json['CANTIDAD_BOTELLAS'] as String,
      recaudado: json['RECAUDADO'] as String,
      comentario: json['COMENTARIO'] as String,
      transaccionFecha: json['FECHA_TRANSACCION'] as String,
      cervezaNombre: json['CERVEZA_NOMBRE'] as String,
      cervezaEstilo: json['CERVEZA_ESTILO'] as String,
      transaccionTipo: json['TRANSACCION_TIPO'] as String
    );
  }
}