import 'package:flutter/foundation.dart';
import 'package:sawken/Model/ResumenTransaccion.dart';
import 'package:sawken/Store/ModelStore.dart';

class ResumenTransaccionesStore extends ModelStore {
  List<ResumenTransaccion> resumenTransacciones = new List<ResumenTransaccion>();
  int _produccionId;
  int _usuarioId;
  
  @override
  bool needLoad ({@required int produccionId,@required int usuarioId}) {
    bool condition = !isLoad || loadEver || _produccionId != produccionId|| _usuarioId != usuarioId;
    this._produccionId =condition ? produccionId :this._produccionId;
    this._usuarioId =condition ? usuarioId :this._usuarioId;
    return condition;
  }
   
  @override
  void loadData({List<ResumenTransaccion> resumenTransacciones}) {
      this.resumenTransacciones = resumenTransacciones;
      isLoad = true;
      super.callSuscribe();
  }

  @override
  void loadFromJson(dynamic jsonObject) {
    List<ResumenTransaccion> _resumenTransacciones = new List<ResumenTransaccion> ();
    dynamic _jsonRowsResumen = jsonObject['transacciones'];
    _jsonRowsResumen.forEach((v){ 
      ResumenTransaccion resumenTransaccion =  new ResumenTransaccion.fromJson(v);
      _resumenTransacciones.add(resumenTransaccion);
    });
    this.loadData(resumenTransacciones: _resumenTransacciones);
  }
}