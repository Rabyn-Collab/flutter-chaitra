import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _form = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormBuilderTextField(
              name: 'title',
            decoration: InputDecoration(
              hintText: 'Title'
            ),
          ),
          SizedBox(height: 16,),
          FormBuilderTextField(name: 'detail',
            decoration: InputDecoration(
                hintText: 'Detail'
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){

          }, child: Text('Submit'))
        ],
      ),
    );
  }
}
