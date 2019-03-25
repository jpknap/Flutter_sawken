import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sawken/Model/User.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isLoading = false;

  void _pressButtonLogin(dynamic jsonForm) {
      setState(() {
        _isLoading = true;
      });
      _loginUser(jsonForm);
  }

  void _loginUser(dynamic jsonForm) async {
    User user = await Store.loginUser(jsonForm['email'], jsonForm['password']);

    if (user != null){
      Navigator.of(context).pushReplacementNamed('/principal');
    }
    else {
    setState(() {
        _isLoading = false;
    });
 
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: !this._isLoading ? 
      Column(
        children: <Widget>[
          Container (color: AppColors.redBackGround, height:_height*0.3),
          Container (color:AppColors.redBackGround, height:_height*0.4, 
          padding: EdgeInsets.fromLTRB(15,0,12,0),          
          child : Center( child: 
          FormBuilder(
                context,
              autovalidate: false,
              controls: [
                FormBuilderInput.textField(
                  type: FormBuilderInput.TYPE_EMAIL,
                  attribute: "email",
                  label: "Email",
                  require: true
                ),  
                FormBuilderInput.textField(
                  type: FormBuilderInput.TYPE_PASSWORD,
                  attribute: "password",
                  label: "Password",
                  require: true,
                )
              ],
              submitButtonContent:  Text("Login"),
              
              onSubmit: (formFiels) {
                if (formFiels != null) {
                  this._pressButtonLogin(formFiels);
                }
                else {

                }
              }
          )
        )
    ),
          Container (color: AppColors.redBackGround , height:_height*0.3 ),
        ],
      )  
      :
      Center ( child:
           SpinKitDoubleBounce(
              color: Colors.white,
              size: 50.0,
            )
          )
    );
  }
}