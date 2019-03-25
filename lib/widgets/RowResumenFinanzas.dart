import 'package:flutter/material.dart';
import 'package:sawken/Model/ResumenFinanzas.dart';
import 'package:sawken/widgets/BoxItemResumen.dart';

class RowResumenFinanzas extends StatelessWidget {
  final ResumenFinanzas resumenFinanzas;

  RowResumenFinanzas({this.resumenFinanzas});

  @override
  Widget build(BuildContext context) {
     return 
        Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                height: 65,
                decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: new BorderRadius.all(const  Radius.circular(5.0)),
                ),
             child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new BoxItemResumen(
                      title:"Ingresos", 
                      subTitle: this.resumenFinanzas.getIngresos()
                      ),
                    new BoxItemResumen(
                      title:"Salidas", 
                      subTitle: this.resumenFinanzas.getSalidas()
                      ),
                    new BoxItemResumen(
                      title:"Caja", 
                      subTitle: this.resumenFinanzas.getCaja()
                      ),
              
                  ],
                ),
                
        );
 
  }
}