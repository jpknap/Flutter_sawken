import 'package:flutter/material.dart';
import 'package:sawken/Model/ResumenGasto.dart';
import 'package:sawken/widgets/BoxItemResumen.dart';

class RowTransaccionGasto extends StatelessWidget {
  final ResumenGasto resumen;
  const RowTransaccionGasto({Key key, this.resumen}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     return 
     new GestureDetector(
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
                    Text( this.resumen.getFullname(),
                     style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[900],
                        )),
                        Text( this.resumen.fechaTransaccion(), 
                    style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[900],
                      ),
                    ),
                    Row (
                      children: <Widget> [
                    Text( 'Invertido : ',
                     style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[600],
                        )),
                    Text( this.resumen.monto(),
                     style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[900],
                        )),
                      ]
                    )                  
                    
                    ]
                    ),
                     
                ),
                Container(
                 margin: EdgeInsets.all(5.0),
                    decoration: new BoxDecoration(
                    border: Border(bottom: BorderSide( color: Colors.grey))
                ),
               ),
               Container (
                 padding: EdgeInsets.fromLTRB(10.0, 5, 5, 5),
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Resumen Compra', style: new TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey,
                        )),
                    Text( this.resumen.resumenCompra().toString(), style: new TextStyle(
                          fontSize: 17,
                          
                          color: Colors.grey[900],
                        )
                    ),
                  ],
                )
                ])),
                ]
                
                ),
                ),
                
            onDoubleTap: () {
              showDialog(  
                context: context,
                builder : (BuildContext context){ 
                return new AlertDialog(
                  title: new Text("Comentario Compra"),
                  content: new Text(resumen.comentarioCompra()),
                  );
                }
              );
              },
              );
  
  }
}