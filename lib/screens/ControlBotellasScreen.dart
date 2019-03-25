import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sawken/Model/ResumenBotellas.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';
import 'package:sawken/widgets/DrawerMenu.dart';
import 'package:sawken/widgets/RowResumenBotellas.dart';


class ControlBotellasScreen extends StatefulWidget {

  @override
  _ControlBotellasScreenState createState() => _ControlBotellasScreenState();
}

class _ControlBotellasScreenState extends State<ControlBotellasScreen> {
  List<ResumenBotellas> _listResumen = new List<ResumenBotellas>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    this.setStateResumenList();
    Store.suscribeResumenProducciones(this.setStateResumenList);
  }
 
  @override
  void dispose(){
    super.dispose();
    Store.removeSuscribeProducciones(this.setStateResumenList);

  }
  
  void setStateResumenList () async  {
    List<ResumenBotellas> _listResumen =  await Store.storeLoadResumenProducciones();
    setState(() {
      this._listResumen = _listResumen;
      this._isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {

     return 
     Scaffold(
          appBar: AppBar(
            title: Text("Control Botellas"),
            backgroundColor: AppColors.black,
          ),
          drawer: new DrawerMenu(),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: AppColors.black,
            child: new Icon (
              Icons.add,
              color: Colors.white
              )
            ,
            onPressed: () async {
              await Navigator.pushNamed(context, '/form_botella_transaccion');
            },
          ),
          backgroundColor: AppColors.redBackGround,
          body: _isLoading ? 
          Center ( child:
                SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 50.0,
                  )
                )
          :
          ListView (
            children : 
            this._listResumen.map((ResumenBotellas resumenBotella){
                  return new RowResumenBotellas(resumenBotellas:resumenBotella);
            }).toList(),
          )
        );
  }
}

