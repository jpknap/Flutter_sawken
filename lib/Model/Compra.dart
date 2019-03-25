class  Compra  {
  final String comentario, usuarioToken, resumen;
  final int monto;

  Compra({this.comentario, this.usuarioToken,this.resumen, this.monto});

  Map<String, String> getMapItems () {
    return {
      "usuario_token" : this.usuarioToken.toString(),
      "resumen" : this.resumen.toString(),
      "comentario" : this.comentario.toString(),
      "monto" : this.monto.toString()
    };
  }
}