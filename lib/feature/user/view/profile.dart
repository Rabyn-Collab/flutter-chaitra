import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:flutter_chaitra/feature/user/view/controllers/user_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(userControllerProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (data) {
            Fluttertoast.showToast(msg: 'profile updated successfully');
          },
          error: (err, st){
            Fluttertoast.showToast(msg: '$err');
          }

      );
    });
    final user = ref.watch(userStateControllerProvider);
    final profileState = ref.watch(userControllerProvider);
 print(user.username);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 100,),
                // FormBuilderTextField(
                //   name: 'name',
                //   readOnly: true,
                //   initialValue: user.role,
                //   decoration: const InputDecoration(label: Text('Role')),
                // ),
                const SizedBox(height: 20,),
                FormBuilderTextField(
                  name: 'username',
                  initialValue: user.username,
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  decoration: const InputDecoration(label: Text('Username')),
                ),
                const SizedBox(height: 20,),
                FormBuilderTextField(
                  name: 'email',
                  initialValue: user.email,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email()
                  ]),
                  decoration: const InputDecoration(label: Text('Email')),
                ),
                const SizedBox(height: 20,),
                ElevatedButton( onPressed: profileState.isLoading ? null : (){
                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                    ref.read(userControllerProvider.notifier).profileUpdate(_formKey.currentState!.value);
                  }

                }, child: profileState.isLoading ? const CircularProgressIndicator() : const Text('Update'),)
              ],
            )
        ),
      ),
    );
  }
}
