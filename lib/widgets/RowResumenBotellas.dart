import 'package:flutter/material.dart';
import 'package:sawken/widgets/BoxItemResumen.dart';
import 'package:sawken/Model/ResumenBotellas.dart';

class RowResumenBotellas extends StatelessWidget {
  final ResumenBotellas resumenBotellas;

  RowResumenBotellas({this.resumenBotellas});

  @override
  Widget build(BuildContext context) {
     return 
     new GestureDetector(
       onTap: () {
          Navigator.of(context).pushNamed('/control_botellas_detalle',arguments: {'produccion_id':resumenBotellas.id});
       },
       child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.all(const  Radius.circular(5.0)),
                ),
                child : Column(
                children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children :  <Widget>[ 
                    Text('Nombre : ', style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        )),
                    Text( this.resumenBotellas.cervezaNombre, style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[900],
                        )),
                    Container (width: 15,), 
                    
                    Text('Estilo : ', style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        )),
                    Text( this.resumenBotellas.cervezaEstilo, style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[900],
                        )),
                    Container (width: 15,), 

                    Text('Recaudado : ', style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        )),
                    Text( this.resumenBotellas.recaudado, style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[900],
                        )),
                        ],
                    
                ),
               Container(
                 margin: EdgeInsets.all(5.0),
                    decoration: new BoxDecoration(
                    border: Border(bottom: BorderSide( color: Colors.grey))
                ),
               ),
               Container(
                 padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new BoxItemResumen(
                      title:"Inicio", 
                      subTitle: this.resumenBotellas.inicio
                      ),
                    new BoxItemResumen(
                      title:"Stock", 
                      subTitle: this.resumenBotellas.stock
                      ),
                    new BoxItemResumen(
                      title:"Vendidas", 
                      subTitle: this.resumenBotellas.venta
                      ),
                    new BoxItemResumen(
                      title:"Merma", 
                      subTitle: this.resumenBotellas.merma
                      ),                
                    new BoxItemResumen(
                      title:"Regalo", 
                      subTitle: this.resumenBotellas.regalo
                      ),
                  ],
                ),)
                ]
                )
              )
              );
  }
}