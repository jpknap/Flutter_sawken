import 'package:sawken/Model/ResumenFinanzas.dart';
import 'package:sawken/Store/ModelStore.dart';

class ResumenFinanzasStore extends ModelStore {
  ResumenFinanzas resumenFinanzas;
  @override
  void loadData({ResumenFinanzas resumenFinanzas}) {
      this.resumenFinanzas = resumenFinanzas;
      this.isLoad = true;
      super.callSuscribe();
  }
  @override
  void loadFromJson(dynamic jsonObject) {
    dynamic _jsonResumen = jsonObject['finanzas'];
    ResumenFinanzas _resumenFinanzas =  new ResumenFinanzas.fromJson(_jsonResumen);
    this.loadData(resumenFinanzas: _resumenFinanzas);
  }
}