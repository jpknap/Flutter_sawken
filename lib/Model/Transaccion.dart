
class  Transaccion  {
  final String comentario, tipo_transaccion, usuarioToken;  
  final recaudado;
  final dynamic lista_venta;

  Transaccion({this.tipo_transaccion, this.comentario, this.usuarioToken, this.lista_venta, this.recaudado});

  Map<String, String> getMapItems () {
    return {
      "usuario_token" : this.usuarioToken,
      "tipo_transaccion" : this.tipo_transaccion,
      "lista_venta" : this.lista_venta.toString(),
      "recaudado" : this.recaudado.toString(),
      "comentario" : this.comentario,
    };
  }
}