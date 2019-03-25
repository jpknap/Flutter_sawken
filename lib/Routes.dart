import 'package:flutter/material.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/screens/ControlBotellasDetalle.dart';
import 'package:sawken/screens/ControlBotellasScreen.dart';
import 'package:sawken/screens/ControlGastos.dart';
import 'package:sawken/screens/FinanzasScreen.dart';
import 'package:sawken/screens/FormBotellaTransaccion.dart';
import 'package:sawken/screens/LoginScreen.dart';
import 'package:sawken/screens/PrincipalScreen.dart';
import 'package:sawken/screens/FormCompra.dart';
class RoutesApp {
  
  Route routeApp (RouteSettings settings){
    switch (settings.name){
      case '/principal':
        return MaterialPageRoute (builder: (BuildContext context) =>new PrincipalScreen());
        break;
      case '/':
        if (Store.storeLoadUserLogin() == null)
          return MaterialPageRoute (builder: (BuildContext context) =>new LoginScreen());
          else
           return MaterialPageRoute (builder: (BuildContext context) =>new PrincipalScreen());
        break;
      case '/control_botellas':
        return MaterialPageRoute (builder: (BuildContext context) =>new ControlBotellasScreen());
        break;
      case '/finanzas':
        return MaterialPageRoute (builder: (BuildContext context) =>new FinanzasScreen());
        break;
      case '/control_compras':
        return MaterialPageRoute (builder: (BuildContext context) =>new ControlGastos());
        break;
      case '/form_botella_transaccion':
        return MaterialPageRoute (builder: (BuildContext context) =>new FormBotellaTransaccion());
        break;
      case '/form_compra':
        return MaterialPageRoute (builder: (BuildContext context) =>new FormCompra());
        break;
      case '/control_botellas_detalle':
        Map<String,String> arguments = settings.arguments;
        return MaterialPageRoute (builder: (BuildContext context) =>new ControlBotellasDetalle(produccionId:arguments['produccion_id']));
        break;
    }                 
  }
}

