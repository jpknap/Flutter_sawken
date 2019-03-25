import 'package:flutter/material.dart';
import 'package:sawken/Model/User.dart';
import 'package:sawken/Store/Store.dart';

class DrawerMenu extends StatelessWidget {

  final User _user = Store.storeLoadUserLogin();

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child : new Column(
            children: <Widget>[
              Expanded (child: ListView(
                children: <Widget>[ Container (
                height: 210,
                child: Column(
                  children: <Widget>[
                    Container(
                       decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(const  Radius.circular(100.0)),
                          color:  Colors.redAccent
                          ),
                       margin: new EdgeInsets.fromLTRB(0, 30, 0, 30),
                      height: 100,
                      width: 100,
                    ),
                    Text(this._user.getFullName(),
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              ListTile (leading: Icon(Icons.home),
                        title: Text('Principal'),
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,'/',ModalRoute.withName('/'));
                        },
              ),
              ListTile (leading: Icon(Icons.business_center),
                        title: Text('Finanzas'),
                        onTap: () {
                            Navigator.of(context).popAndPushNamed('/finanzas');
                        },
              ),
              ListTile (leading: Icon(Icons.gesture),
                        title: Text('Control Botellas'),
                        onTap: () {
                            Navigator.of(context).popAndPushNamed('/control_botellas');
                        },
              ),
              ListTile (leading: Icon(Icons.payment),
                        title: Text('Control Compras'),
                        onTap: () {
                            Navigator.of(context).popAndPushNamed('/control_compras');
                        },
              ),
             ],
              ),
            ),
          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Login Out'),
                          onTap: () async {
                            await Store.loginOut();
                            Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                          }
                          ,)
                          , 
                    ],
                  )
                )
              )
            )
            ],
      )
    );
  }
}