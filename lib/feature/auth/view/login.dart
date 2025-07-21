import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/shared/common_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final model = ref.watch(validateModeProvider('Login'));
    final passShow = ref.watch(passControllerProvider('Login'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
          key: _formKey,
            child: ListView(
              children: [
                Gap(40),
                FormBuilderTextField(
                    name: 'email',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                   hintText: 'Enter your email',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                Gap(20),
                FormBuilderTextField(
                  name: 'password',
                  obscureText: passShow,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(passShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        ref.read(passControllerProvider('Login').notifier).change();
                      },
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                Gap(20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {

                    }else{
                      ref.read(validateModeProvider('Login').notifier).change();
                    }
                  },
                  child: Text('Login'),
                ),

              ],
            )
        ),
      ),
    );
  }
}
