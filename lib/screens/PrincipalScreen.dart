import 'package:flutter/material.dart';
import 'package:sawken/Utilities/AppColors.dart';
import 'package:sawken/widgets/DrawerMenu.dart';

class PrincipalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Sawken"),
            backgroundColor: AppColors.black,
          ),
          drawer: new DrawerMenu(),
          backgroundColor: AppColors.redBackGround,
          body: Container (
            child: Center(
              child: ListView(
              padding: EdgeInsets.only(top: 175),
              children: [
              GestureDetector(
                onTap:() {
                   Navigator.pushNamed(context, '/form_botella_transaccion');
                },
                 child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius:  new BorderRadius.all(const  Radius.circular(5.0)),
                    color: AppColors.black,
                  ),
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment(0, 0),
                  child: Text("Realizar Transacción Botellas"),
                ),
              ),
              GestureDetector(
                onTap:() {
                   Navigator.pushNamed(context, '/form_compra');
                },
                 child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius:  new BorderRadius.all(const  Radius.circular(5.0)),
                    color: AppColors.black,
                  ),
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment(0, 0),
                  child: Text("Realizar Compra"),
                ),
              ),
              
              ]
              )
          )
          )
          );
  }
}