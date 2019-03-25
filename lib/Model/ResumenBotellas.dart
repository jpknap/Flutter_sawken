class ResumenBotellas {
final String id, fechaCrea, inicio, cervezaNombre,cervezaEstilo, stock, merma, regalo, venta,recaudado;
  ResumenBotellas({this.id, this.fechaCrea, this.inicio, this.cervezaNombre, this.cervezaEstilo, this.stock, this.merma,this.regalo,this.venta,this.recaudado});
  factory ResumenBotellas.fromJson(dynamic json) {
    return ResumenBotellas(
      id: json['ID'] as String,
      fechaCrea: json['FECHA_CREA'] as String,
      inicio: json['INICIO'] as String,
      cervezaNombre: json['CERVEZA_NOMBRE'] as String,
      cervezaEstilo: json['CERVEZA_ESTILO'] as String,
      stock: json['STOCK'] as String,
      merma: json['MERMA'] as String,
      regalo: json['REGALO'] as String,
      venta: json['VENTA'] as String,
      recaudado: json['RECAUDADO'] as String,
    );
  }
}