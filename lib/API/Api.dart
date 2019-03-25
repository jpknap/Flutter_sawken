import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sawken/API/ApiConfig.dart';

class Api  {

  Future<dynamic> getRowResumen() async {
    dynamic _jsonBody ;
    http.Client client = new http.Client();
    String _url = ApiConfig.getResumenProducciones();
    final response = await client.get(_url);
     _jsonBody = json.decode(response.body);
    return _jsonBody;
  }
  
  Future<dynamic> getRowResumenTransaccion(int userId , int produccionId) async {
    
    http.Client client = new http.Client();
    String _url = ApiConfig.getResumenProduccionTransacciones(usuarioId: userId, produccionId: produccionId);
    final response = await client.get(_url);
    dynamic _jsonBody = json.decode(response.body);
    return _jsonBody;
  
   }
  Future<dynamic> getRowResumenCompras() async {
    
    http.Client client = new http.Client();
    String _url = ApiConfig.getResumenCompras();
    final response = await client.get(_url);
    dynamic _jsonBody = json.decode(response.body);
    return _jsonBody;
  
   }

    Future<dynamic> getRowResumenFinanzas() async {
    
    http.Client client = new http.Client();
    String _url = ApiConfig.getResumenFinanzas();
    final response = await client.get(_url);
    dynamic _jsonBody = json.decode(response.body);
    return _jsonBody;
  
   }
  
  Future<dynamic> getLoginUser(dynamic body) async {
    
    http.Client client = new http.Client();
    String _url = ApiConfig.loginUser();
    body
    ..addAll({'operacion':'7'});
    final response = await client.post(_url,body:body);
    // Usa la función compute para ejecutar parse en un isolate separado
    return json.decode(response.body)['user'];
  
   }

  Future<bool> saveTransaccion(dynamic body) async{
    http.Client client = new http.Client();
    String _url = ApiConfig.addProduccionTransaccion();
    body
    ..addAll({'operacion':'100'});
    final response = await client.post(_url,body:body);
    
    // Usa la función compute para ejecutar parse en un isolate separado
    return json.decode(response.body)['transaccion'];
   }

  Future<bool> saveCompra(dynamic body) async{
    http.Client client = new http.Client();
    String _url = ApiConfig.addCompra();
    body
    ..addAll({'operacion':'101'});
    final response = await client.post(_url,body:body);
    
    // Usa la función compute para ejecutar parse en un isolate separado
    return json.decode(response.body)['transaccion'];
   }

}