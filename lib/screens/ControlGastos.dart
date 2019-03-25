
import 'package:flutter/material.dart';
import 'package:sawken/Model/ResumenGasto.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sawken/widgets/DrawerMenu.dart';
import 'package:sawken/widgets/RowTransaccionGasto.dart';


class ControlGastos extends StatefulWidget {
  ControlGastos({Key key}) : super(key: key);

  @override
  _ControlGastosState createState() => new _ControlGastosState();
}
 

class _ControlGastosState extends State<ControlGastos> {
  bool _isLoad = false;

  _ControlGastosState();
 List<ResumenGasto> listResumenGasto = new List<ResumenGasto> ();

 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    setStateResumenList(); 
    Store.suscribeResumenCompra(this.setStateResumenList);
  }
 
  @override
  void dispose(){
    super.dispose();
    Store.removeSuscribeCompra(this.setStateResumenList);

  }

  void setStateResumenList() async  {
    setState(() {
      this._isLoad = false;
    });
    List<ResumenGasto> _listResumen =  await Store.storeLoadResumenCompra();
        setState(() {
          this.listResumenGasto = _listResumen;
          this._isLoad = true;
        });
      }
    
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        
          appBar: AppBar(
            title: Text("Control Compras"),
            
            backgroundColor: AppColors.black,
            actions: <Widget>[
              PopupMenuButton (
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
            
                  },
                )
            ],
          ),
           drawer: new DrawerMenu(),

          floatingActionButton: new FloatingActionButton(
            backgroundColor: AppColors.black,
              child: new Icon (
          Icons.add,
          color: Colors.white
          ),
            onPressed: () {
              Navigator.pushNamed(context, '/form_compra');
            },
          ),
        
          backgroundColor: AppColors.redBackGround,
          body: this._isLoad 
          ? ListView (
            children : 
            this.listResumenGasto.map((ResumenGasto resumen){
                  return new RowTransaccionGasto(resumen:resumen);
            }).toList() ) 
            : 
            Center ( child:
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 50.0,
            )
            ),
            );
          
  }
  
}
    
