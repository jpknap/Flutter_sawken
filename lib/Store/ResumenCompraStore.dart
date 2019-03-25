import 'package:sawken/Model/ResumenGasto.dart';
import 'package:sawken/Store/ModelStore.dart';

class ResumenCompraStore extends ModelStore {
  List<ResumenGasto> resumenTransacciones = new List<ResumenGasto>();
  @override
  void loadData({List<ResumenGasto> resumenTransacciones}) {
      this.resumenTransacciones = resumenTransacciones;
      isLoad = true;
      super.callSuscribe();
  }
  @override
  void loadFromJson(dynamic jsonObject) {
    List<ResumenGasto> _resumenTransacciones = new List<ResumenGasto> ();
    dynamic _jsonRowsResumen = jsonObject['transacciones'];
    _jsonRowsResumen.forEach((v){ 
      ResumenGasto resumenTransaccion =  new ResumenGasto.fromJson(v);
      _resumenTransacciones.add(resumenTransaccion);
    });
    this.loadData(resumenTransacciones: _resumenTransacciones);
  }
}