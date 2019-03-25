import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sawken/Model/ResumenFinanzas.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';
import 'package:sawken/widgets/DrawerMenu.dart';
import 'package:sawken/widgets/RowResumenFinanzas.dart';


class FinanzasScreen extends StatefulWidget {

  @override
  _FinanzasScreenState createState() => _FinanzasScreenState();
}

class _FinanzasScreenState extends State<FinanzasScreen> {
  ResumenFinanzas _finanzas;
  bool _isLoading = true;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setStateResumenFinanza();
    Store.suscribeResumenFinanzas(this.setStateResumenFinanza);
  }

    @override
  void dispose(){
    super.dispose();
    Store.removeSuscribeFinanzas(this.setStateResumenFinanza);

  }

  void setStateResumenFinanza() async  {
     setState(() {
      this._isLoading = true;
    });
    ResumenFinanzas _listResumen =  await Store.storeLoadResumenFinanzas();
    setState(() {
      this._finanzas = _listResumen;
      this._isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {

     return 
     Scaffold(
          appBar: AppBar(
            title: Text("Finanzas"),
            backgroundColor: AppColors.black,
          ),
          drawer: new DrawerMenu(),
          backgroundColor: AppColors.redBackGround,
          body: _isLoading ? 
          Center ( child:
                SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 50.0,
                  )
                )
          :
          new RowResumenFinanzas(resumenFinanzas: _finanzas)
          
        );
  }
}

