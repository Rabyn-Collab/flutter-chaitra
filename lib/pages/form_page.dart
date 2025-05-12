import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
             key: _formKey,
            child: ListView(
              children: [

                FormBuilderTextField(
                    name: 'username',
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.note_alt_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)
                    )
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required()
                  ]),

                ),
                SizedBox(height: 40,),

                ElevatedButton(onPressed: (){

                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                    print(_formKey.currentState!.value);

                  }


                }, child: Text('Submit'))

              ],
            )
        ),
      ),
    );
  }
}
