import 'package:flutter/material.dart';
import 'package:flutter_chaitra/models/blog.dart';
import 'package:flutter_chaitra/providers/blog_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';


class UpdateForm extends ConsumerStatefulWidget {
  final Blog blog;
  const UpdateForm({super.key, required this.blog});

  @override
  ConsumerState<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends ConsumerState<UpdateForm> {
  final _form = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(blogControllerProvider, (previous, next) {
      next.maybeWhen(
          data: (data){
            context.pop();
            Fluttertoast.showToast(
                msg: 'Blog Updated Successfully',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM);
          }, error: (err, st){
        Fluttertoast.showToast(
            msg: err.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      }, orElse: ()   => null);
    });

    final blogState = ref.watch(blogControllerProvider);
    return FormBuilder(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 20,),
                  FormBuilderTextField(
                    name: 'title',
                    initialValue: widget.blog.title ,
                    decoration: InputDecoration(
                        hintText: 'Title'
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required()
                    ]),
                  ),
                  SizedBox(height: 16,),
                  FormBuilderTextField(
                    name: 'detail',
                    initialValue: widget.blog.detail ,
                    decoration: InputDecoration(
                        hintText: 'Detail'
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required()
                    ]),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: blogState.isLoading ? null : (){
                        FocusScope.of(context).unfocus();
                        if(_form.currentState!.saveAndValidate(focusOnInvalid: false)){
                          final data = _form.currentState!.value;
                          ref.read(blogControllerProvider.notifier).updateBlog(data, widget.blog.id);

                        }

                      }, child: blogState.isLoading ? Center(child: CircularProgressIndicator()) : Text('Submit'))

                ],
              ),
              Positioned(
                  right: 0,
                  child: IconButton(onPressed: (){
                    context.pop();
                  }, icon: Icon(Icons.close)))
            ],
          ),

        ],
      ),
    );
  }
}
