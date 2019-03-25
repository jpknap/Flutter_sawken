
import 'package:flutter/material.dart';
import 'package:sawken/Model/ResumenTransaccion.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';
import 'package:sawken/widgets/RowResumenTransaccion.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ControlBotellasDetalle extends StatefulWidget {
  @required final String produccionId;
  ControlBotellasDetalle({Key key, this.produccionId}) : super(key: key);

  @override
  _ControlBotellasDetalleState createState() => new _ControlBotellasDetalleState(this.produccionId);
}
 

class _ControlBotellasDetalleState extends State<ControlBotellasDetalle> {
  final String produccionId;
  int usuarioId= 0;
  bool _isLoad = false;

  _ControlBotellasDetalleState(this.produccionId);
 List<ResumenTransaccion> listResumenTransaccion = new List<ResumenTransaccion> ();
 @override
  void initState() {
    super.initState();
    this.setStateResumenList();
    Store.suscribeResumenTransacciones(this.setStateResumenList);
  }
  @override
  void deactivate(){
    Store.removeSuscribeTransacciones(setStateResumenList);
    super.deactivate();

  }

  void setStateResumenList() async  {
    List<ResumenTransaccion> _listResumen =  await Store.storeLoadResumenTransacciones( produccionId: int.parse(produccionId),usuarioId: usuarioId );
    setState(() {
      this.listResumenTransaccion = _listResumen;
      this._isLoad = true;
    });
  }

  void reloadTransaccionesDetalis(int usuarioId) {
    this.usuarioId =usuarioId;
    setState(() { this._isLoad = false;});
    Store.storeLoadResumenTransacciones(produccionId: int.parse(produccionId), usuarioId: usuarioId);
  }

 @override
  Widget build(BuildContext context) {
     return Scaffold(
          appBar: AppBar(
            title: Text("Control Botellas"),
            backgroundColor: AppColors.black,
            actions: <Widget>[
              PopupMenuButton (
                onSelected: (value) {reloadTransaccionesDetalis(value);},
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem( 
                      child:Text ('Pablo Riquelme'),
                      value: 3,
                      ),
                    PopupMenuItem(
                      child: Text ('Juan Muñoz'),
                      value: 1,
                      ),
                    PopupMenuItem(
                      child: Text ('Juan Gacitua'),
                      value: 2,
                      ),
                    PopupMenuItem(
                       value: 0,
                       child: Text ('Todos'),),
                    ];
                  },
                )
            ],
          ),
        
          backgroundColor: AppColors.redBackGround,
          body: this._isLoad ? ListView (
            children : 
            this.listResumenTransaccion.map((ResumenTransaccion resumen){
                  return new RowResumenTransaccion(resumen:resumen);
            }).toList() ) : 
              Center ( child:
           SpinKitDoubleBounce(
              color: Colors.white,
              size: 50.0,
            )
            ),
            );
          
  }
  
}