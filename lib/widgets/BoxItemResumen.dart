import 'package:flutter/material.dart';

class BoxItemResumen extends StatelessWidget {

  @required final String title;
  @required final String subTitle;
  final double sizeFont;
  BoxItemResumen({this.title, this.subTitle, this.sizeFont = 17.0});

  @override
  Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.all(5),
                child :Column(
                  children: <Widget>[
                    Text(this.title, style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        )),
                    Text( this.subTitle.toString(), style: new TextStyle(
                          fontSize: this.sizeFont,
                          
                          color: Colors.grey[900],
                        )
                    ),
                  ],
                ),
                
              );
  }
}