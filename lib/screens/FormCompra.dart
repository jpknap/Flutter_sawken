import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sawken/Model/Compra.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';

class FormCompra extends StatefulWidget {

  @override
  _FormCompraState createState() => _FormCompraState();

}

class _FormCompraState extends State<FormCompra> {

  Future<bool> _saveTransaccion (dynamic formFields) async {
    Compra transaccion =  new Compra (
      usuarioToken: Store.storeLoadUserLogin().getTokenUser(),
      comentario: formFields['comentario'],
      resumen: formFields['resumen'],
      monto: formFields['monto']
    );
    bool reponse = await Store.saveCompra(transaccion);
    return reponse;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Transacción Compra"),
            backgroundColor: AppColors.black
          ),
          body: 
          Container(
            padding: EdgeInsets.all(10),
              child: 
              FormBuilder(
              context,
              autovalidate: false,
              controls: [
                FormBuilderInput.textField(
                  type: FormBuilderInput.TYPE_TEXT,
                  attribute: "resumen",
                  label: "Resumen Compra",
                  max: 25,
                  require: true,
                ), 
                FormBuilderInput.textField(
                  type: FormBuilderInput.TYPE_NUMBER,
                  attribute: "monto",
                  label: "Valor",
                  min: 0,
                  require: true,
                ), 
                FormBuilderInput.textField(
                  type: FormBuilderInput.TYPE_MULTILINE_TEXT,
                  attribute: "comentario",
                  label: "Comentario",
                  require: false,
                ), 
              ],
              submitButtonContent:  Text("Guardar"),
              
              onSubmit: (formFiels)async {
                if (formFiels != null) {
                   
                  bool reponse = await _saveTransaccion(formFiels);
                   if (reponse) {
                      Navigator.of(context).pop();
                    }
                  }
              },
            )
            )
       ) ;
  }
}
