class  Transaccion  {
  final String comentario, usuarioToken;  
  final cervezaId, tipoId, cantidad, recaudado;

  Transaccion({this.comentario, this.usuarioToken, this.cervezaId, this.tipoId, this.cantidad, this.recaudado});

  Map<String, String> getMapItems () {
    return {
      "usuario_token" : this.usuarioToken,
      "produccion_id" : this.cervezaId.toString(),
      "tipo_id" : this.tipoId.toString(),
      "cantidad" : this.cantidad.toString(),
      "recaudado" : this.recaudado.toString(),
      "comentario" : this.comentario,
    };
  }
}