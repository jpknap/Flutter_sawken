import 'package:flutter/material.dart';
import 'package:sawken/Model/ResumenTransaccion.dart';
import 'package:sawken/widgets/BoxItemResumen.dart';

class RowResumenTransaccion extends StatelessWidget {
  final ResumenTransaccion resumen;
  const RowResumenTransaccion({Key key, this.resumen}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     return new GestureDetector(
     child : new Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.all(const  Radius.circular(5.0)),
                ),
                child : Column(
                children: <Widget>[
                Container (
                  padding: EdgeInsets.all(5),
                  child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children :  <Widget>[ 
                    Text( "${this.resumen.usuarioNombre} ${this.resumen.usuarioApellido}", style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[900],
                          
                        )),
                        Row (
                          children: <Widget>[
                  Text('  Tanda : ', style: new TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey,
                        )),
                    Text( this.resumen.cervezaNombre, style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[900],
                        ))
                          ]),
        
                    Row(
                      children: <Widget>[
                    Text( this.resumen.transaccionFecha, style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[900],
                        )),
                      ],
                    )
                  
                        ],
                    
                ),
                ),
                Container(
                 margin: EdgeInsets.all(5.0),
                    decoration: new BoxDecoration(
                    border: Border(bottom: BorderSide( color: Colors.grey))
                ),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new BoxItemResumen(
                      title:"Transacción", 
                      subTitle: resumen.transaccionTipo
                      ),
                    new BoxItemResumen(
                      title:"Cantidad", 
                      subTitle: resumen.cantidadBotellas
                      ),
                    new BoxItemResumen(
                      title:"Recaudado", 
                      subTitle: resumen.recaudado
                      ),
                  ],
                ),
                ]
                )
            ),
            onDoubleTap: () {
              showDialog(  
                context: context,
                builder : (BuildContext context){ 
                return new AlertDialog(
                  title: new Text("Comentario transacción"),
                  content: new Text(resumen.comentario),
                  );
                }
              );
              },
              );
  }
}