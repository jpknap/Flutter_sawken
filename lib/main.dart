import 'package:flutter/material.dart';
import 'package:sawken/Store/Store.dart';
import 'Routes.dart';

void main () async {
  await Store.loadFromStore();
  runApp(
    new MaterialApp(
      title: 'Sawken App ',
      theme: ThemeData(
        brightness: Brightness.dark,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.yellowAccent),   
                      ),    
             )
      ),
      initialRoute: '/',
      onGenerateRoute: RoutesApp().routeApp,
    )
  ); 
}

