import 'package:sawken/API/Api.dart';
import 'package:sawken/Model/Compra.dart';
import 'package:sawken/Model/ResumenBotellas.dart';
import 'package:sawken/Model/ResumenFinanzas.dart';
import 'package:sawken/Model/ResumenGasto.dart';
import 'package:sawken/Model/ResumenTransaccion.dart';
import 'package:sawken/Model/Transaccion.dart';
import 'package:sawken/Model/User.dart';
import 'package:sawken/Store/ResumenCompraStore.dart';
import 'package:sawken/Store/ResumenFinanzasStore.dart';
import 'package:sawken/Store/ResumenProduccionStore.dart';
import 'package:sawken/Store/ResumenTransaccionesStore.dart';
import 'package:sawken/Store/UserStore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Store {
  
  static final ResumenProduccionList _resumenProduccionList= new ResumenProduccionList();
  static final ResumenTransaccionesStore _resumenTransacciones= new ResumenTransaccionesStore();
  static final UserStore _userLogin= new UserStore();
  static final ResumenCompraStore _resumenCompras= new ResumenCompraStore();
  static final ResumenFinanzasStore _resumenFinanzas= new ResumenFinanzasStore();

  static Future<List<ResumenBotellas>> storeLoadResumenProducciones({forceLoad:false}) async {
    if(_resumenProduccionList.needLoad() || forceLoad){
      dynamic _jsonResumenProduccion = await new Api().getRowResumen();
      _resumenProduccionList.loadFromJson(_jsonResumenProduccion);
    }
    return _resumenProduccionList.resumenProducciones;
  }
  static suscribeResumenProducciones(Function functionSuscribe){
    _resumenProduccionList.addSusbcribe(functionSuscribe);
  }
  static removeSuscribeProducciones(Function funtionRemoved) {
    _resumenProduccionList.removeSubcribe(funtionRemoved);
  }

  static Future<User> loginUser(String email, String password) async{
    Map<String,String> _body = {
      'email':email,
      'password':password
    };
    try{ 
        User userLogin = _userLogin.loadFromJson(await new Api().getLoginUser(_body));
        await _saveUserInStorePhone(email,password);
        return userLogin;

    }
    catch(Exeption){
      return null;
    }
  }
  static User storeLoadUserLogin({forceLoad:false}) {
    return _userLogin.user;
  }
  static suscribeUserLogin(Function functionSuscribe){
    _userLogin.addSusbcribe(functionSuscribe);
  }
  static removeSuscribeUserLogin(Function funtionRemoved) {
    _userLogin.removeSubcribe(funtionRemoved);
  }


  static Future<bool> saveProduccionTransaccion(Transaccion transaccion) async{
    bool response = await new Api().saveTransaccion(transaccion.getMapItems());
    Store.storeLoadResumenProducciones(forceLoad: true);
    storeLoadResumenFinanzas(forceLoad: true);
    return response;
  }
  static Future<List<ResumenTransaccion>> storeLoadResumenTransacciones({forceLoad:false, int produccionId, int usuarioId = 0}) async {
    if(_resumenTransacciones.needLoad(produccionId:produccionId, usuarioId: usuarioId) || forceLoad){
      dynamic _jsonResumenTransacciones= await new Api().getRowResumenTransaccion(usuarioId, produccionId);
      _resumenTransacciones.loadFromJson(_jsonResumenTransacciones);
    }
    return _resumenTransacciones.resumenTransacciones;
  }
  static suscribeResumenTransacciones(Function functionSuscribe){
    _resumenTransacciones.addSusbcribe(functionSuscribe);
  }
  static removeSuscribeTransacciones(Function funtionRemoved) {
    _resumenTransacciones.removeSubcribe(funtionRemoved);
  }

 
  static Future<bool> saveCompra(Compra transaccion) async{
    bool response = await new Api().saveCompra(transaccion.getMapItems());
    storeLoadResumenCompra(forceLoad: true);
    storeLoadResumenFinanzas(forceLoad: true);
    return response;
  }
  static Future<List<ResumenGasto>> storeLoadResumenCompra({forceLoad:false}) async {
    if(_resumenCompras.needLoad() || forceLoad){
      dynamic _jsonResumenTransacciones= await new Api().getRowResumenCompras();
      _resumenCompras.loadFromJson(_jsonResumenTransacciones);
    }
    return _resumenCompras.resumenTransacciones;
  }
  static suscribeResumenCompra(Function functionSuscribe){
    _resumenCompras.addSusbcribe(functionSuscribe);
  }
  static removeSuscribeCompra(Function funtionRemoved) {
    _resumenCompras.removeSubcribe(funtionRemoved);
  }

  static Future<ResumenFinanzas> storeLoadResumenFinanzas({forceLoad:false}) async {
    if(_resumenFinanzas.needLoad() || forceLoad){
      dynamic _jsonResumenTransacciones= await new Api().getRowResumenFinanzas();
      _resumenFinanzas.loadFromJson(_jsonResumenTransacciones);
    }
    return _resumenFinanzas.resumenFinanzas;
  }
  static suscribeResumenFinanzas(Function functionSuscribe){
    _resumenFinanzas.addSusbcribe(functionSuscribe);
  }
  static removeSuscribeFinanzas(Function funtionRemoved) {
    _resumenFinanzas.removeSubcribe(funtionRemoved);
  }


  static Future<void> _saveUserInStorePhone(email, password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_email', email);
  await prefs.setString('user_password', password);
}
  static Future<void> loadFromStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _email = prefs.getString('user_email');
    String _password = prefs.getString('user_password');
    await loginUser(_email,_password);
  }
  static Future<bool> loginOut() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.clear();
   _userLogin.loadData(user: null);
   return true;
  }
}
