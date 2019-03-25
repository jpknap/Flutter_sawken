import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sawken/Model/Transaccion.dart';
import 'package:sawken/Store/Store.dart';
import 'package:sawken/Utilities/AppColors.dart';
class FormBotellaTransaccion extends StatefulWidget {
  @override
  _FormBotellaTransaccionState createState() => _FormBotellaTransaccionState();
}

class _FormBotellaTransaccionState extends State<FormBotellaTransaccion> {

  int cantidad=0,recaudado=0, cervezaId = 1, transaccionTipoId = 1;
  

  Future<bool> _saveTransaccion (dynamic formFields) async {
    Transaccion transaccion =  new Transaccion (
      usuarioToken: Store.storeLoadUserLogin().getTokenUser(),
      comentario: formFields['comentario'],
      tipoId: formFields['tipo_id'],
      recaudado: formFields['recaudado'],
      cantidad: formFields['cantidad'],
      cervezaId: formFields['cerveza_id'],
    );
    bool reponse = await Store.saveProduccionTransaccion(transaccion);
    return reponse;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Transacción Botella"),
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
                FormBuilderInput.dropdown(
                  attribute: "cerveza_id",
                  require: true,
                  label: "Tanda Cerveza",
                  value: this.cervezaId,
                  hint: "Seleccione tanda",
                  options: [
                    FormBuilderInputOption(label:"RED IPA" ,value: 1 ),
                    FormBuilderInputOption(label:"IRA",value: 2)
                  ],
                ),
                FormBuilderInput.textField(
                  type: FormBuilderInput.TYPE_NUMBER,
                  attribute: "cantidad",
                  label: "Cantidad",
                  require: true,
                  value: this.cantidad
                ),
                FormBuilderInput.dropdown(
                      attribute: "tipo_id",
                      require: true,
                      label: "Tipo Transacción",
                      value: transaccionTipoId,
                      hint: "Seleccione tipo transacción",
                      options: [
                        FormBuilderInputOption(label:"Venta",value:1),
                        FormBuilderInputOption(label:"Regalo",value: 2),
                        FormBuilderInputOption(label:"Merma",value:3),
                      ],
                ),  
                FormBuilderInput.textField(
                  type: FormBuilderInput.TYPE_NUMBER,
                  attribute: "recaudado",
                  value: this.recaudado,
                  label: "Precio",
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
