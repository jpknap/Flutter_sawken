
import 'package:sawken/Model/ResumenBotellas.dart';
import 'package:sawken/Store/ModelStore.dart';

class ResumenProduccionList extends ModelStore {
  List<ResumenBotellas> resumenProducciones = new List<ResumenBotellas>();

  @override
  void loadData({List<ResumenBotellas> listResumenBotellas}) {
      this.resumenProducciones = listResumenBotellas;
      isLoad = true;
      super.callSuscribe();
  }

  @override
  void loadFromJson(dynamic jsonObject) {
    List<ResumenBotellas> _resumenProducciones = new List<ResumenBotellas> ();
    dynamic _jsonRowsResumen = jsonObject['producciones'];
    _jsonRowsResumen.forEach((v){ 
      ResumenBotellas resumenBotellas =  new ResumenBotellas.fromJson(v);
      _resumenProducciones.add(resumenBotellas);
    });
    this.loadData(listResumenBotellas:_resumenProducciones);
  }
}