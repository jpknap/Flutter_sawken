import 'package:flutter/material.dart';
import 'package:positioned_tap_detector/positioned_tap_detector.dart';
import 'package:sawken/Model/Transaccion.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';


class FormBotellaTransaccion extends StatefulWidget {
  @override
  _FormBotellaTransaccionState createState() => _FormBotellaTransaccionState();
}

class _FormBotellaTransaccionState extends State<FormBotellaTransaccion> {

  int cantidad=0,recaudado=0, cervezaId = 1, transaccionTipoId = 1;
  Cerveza _cervezaIRA = new Cerveza() ;
  Cerveza _cervezaIPA = new Cerveza() ;
  Cerveza _cervezaStout = new Cerveza();
  String _radioTipoTransaccion = "tipo_transaccion";
  int _radioValue = 1;
  Future<bool> _saveTransaccion (dynamic formFields) async {
    Transaccion transaccion =  new Transaccion (
      usuarioToken: Store.storeLoadUserLogin().getTokenUser(),
      comentario: formFields['comentario'],
      tipoId: formFields['tipo_id'],
      recaudado: formFields['recaudado'],
      cantidad: formFields['cantidad'],
      cervezaId: formFields['cerveza_id'],
    );
    bool reponse = await Store.saveProduccionTransaccion(transaccion);
    return reponse;
  }
  var txt = new TextEditingController(text: "0");
  
  void actionTapCerveza (int cant , String action, Cerveza cerveza_tipo) {
    if (action == 'sum'){
        cerveza_tipo.cantidad = cerveza_tipo.cantidad  + cant;
    }
    else if (action == 'sub'){
        cerveza_tipo.cantidad  = cerveza_tipo.cantidad  - cant;
        cerveza_tipo.cantidad  = cerveza_tipo.cantidad  < 0 ? 0 : cerveza_tipo.cantidad ;
    }
    txt.text = _handleCalculatorValorVenta().toString();

    setState(() {
    });
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
  
  int _handleCalculatorValorVenta(){
    int cant_total = _cervezaIPA._cantidad + _cervezaIRA._cantidad + _cervezaStout.cantidad;
    int packs =  (cant_total/6).toInt(); 
    int botellasUnitarias = cant_total -packs*6;
    int valor_boleta = packs*5000 + botellasUnitarias *1000;
    return valor_boleta;
  }

  @override
  Widget build(BuildContext context) {
    double _width_selector = MediaQuery.of(context).size.width/3-20;
    return Scaffold(

          appBar: AppBar(
            title: Text("Transacción Botella"),
            backgroundColor: AppColors.black
          ),
           persistentFooterButtons: <Widget>[
            FlatButton(
            color: Colors.blue[400],
            padding: EdgeInsets.fromLTRB(25,5,25,5),
            onPressed: () {
            },
            child: Text(
              "Guardar",
              style: TextStyle(
                color: Colors.white
              ),
            ))],
          
          body: Container(
                padding: EdgeInsets.all(10),
                  child: 
                  ListView( 
                    children: <Widget> [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      PositionedTapDetector(
                        onTap: (position) {
                          double _mitadContainer = _width_selector/2;
                          if(_mitadContainer<position.relative.dx)
                            this.actionTapCerveza(1,'sum',_cervezaIRA);
                            else 
                            this.actionTapCerveza(1, 'sub',_cervezaIRA);
                        },
                        onDoubleTap: (position){
                          double _mitadContainer = _width_selector/2;
                          if(_mitadContainer<position.relative.dx)
                            this.actionTapCerveza(6,'sum',_cervezaIRA);
                            else 
                            this.actionTapCerveza(6, 'sub',_cervezaIRA);
                        },
                        child: 
                        Container(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          width: _width_selector,
                          height: _width_selector * 1.2,
                          decoration: BoxDecoration(          
                          borderRadius: new BorderRadius.all(const  Radius.circular(5.0)),
                          color:  Colors.red[200]),
                          child: Text(this._cervezaIRA.cantidad.toString(),
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          )),
                        )
                      ),
                    
                      PositionedTapDetector(
                        onTap: (position) {
                          double _mitadContainer = _width_selector/2;
                          if(_mitadContainer<position.relative.dx)
                            this.actionTapCerveza(1,'sum',_cervezaIPA);
                            else 
                            this.actionTapCerveza(1, 'sub',_cervezaIPA);
                        },
                        onDoubleTap: (position){
                          double _mitadContainer = _width_selector/2;
                          if(_mitadContainer<position.relative.dx)
                            this.actionTapCerveza(6,'sum',_cervezaIPA);
                            else 
                            this.actionTapCerveza(6, 'sub',_cervezaIPA);
                        },
                        child: 
                        Container(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          width: _width_selector,
                          height: _width_selector * 1.2,
                          decoration: BoxDecoration(          
                          borderRadius: new BorderRadius.all(const  Radius.circular(5.0)),
                          color:  Colors.green[200]),
                          child: Text(this._cervezaIPA.cantidad.toString(),
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          )),
                        )
                      ),
                    
                      PositionedTapDetector(
                        onTap: (position) {
                          double _mitadContainer = _width_selector/2;
                          if(_mitadContainer<position.relative.dx)
                            this.actionTapCerveza(1,'sum',_cervezaStout);
                            else 
                            this.actionTapCerveza(1, 'sub',_cervezaStout);
                        },
                        onDoubleTap: (position){
                          double _mitadContainer = _width_selector/2;
                          if(_mitadContainer<position.relative.dx)
                            this.actionTapCerveza(6,'sum',_cervezaStout);
                            else 
                            this.actionTapCerveza(6, 'sub',_cervezaStout);
                        },
                        child: 
                        Container(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          width: _width_selector,
                          height: _width_selector * 1.2,
                          decoration: BoxDecoration(          
                          borderRadius: new BorderRadius.all(const  Radius.circular(5.0)),
                          color:  Colors.grey[700]),
                          child: Text(this._cervezaStout.cantidad.toString(),
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          )),
                        )
                      ),

                  
                    ],
                  ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  padding: EdgeInsets.all(8.0),
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          'Seleccione tipo de transacción',
                          style: new TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(8.0),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text(
                              'Venta',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text(
                              'Regalo',
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            new Radio(
                              value: 3,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text(
                              'Merma',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                          ],
                        )
                    ]
                    )
                  ),
                  Column (
                    children : <Widget>[ new Text(
                          'Valor Venta',
                          style: new TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ) ,
                    Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        controller: txt,
                        decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      )
                                    
                    )]
                  ),
                  Column (
                    children : <Widget>[new Text(
                          'Comentario',
                          style: new TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ) ,
                    new TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                  ),])
                  ]
                  )
          
          )
        
    );
    }
}

class Cerveza {
  int _cantidad = 0;
  int get cantidad => _cantidad;
  set cantidad(int cantidad) {
    _cantidad = cantidad;
  }
}
