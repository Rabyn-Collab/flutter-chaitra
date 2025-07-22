import 'package:flutter/material.dart';
import 'package:flutter_chaitra/common/show_toasts.dart';
import 'package:flutter_chaitra/feature/auth/view/controllers/auth_controller.dart';
import 'package:flutter_chaitra/feature/shared/common_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(signUpControllerProvider, (prev, next) {
      next.maybeWhen(
        loading: () => context.loaderOverlay.show(),
        data: (value) {
          context.loaderOverlay.hide();
          Toasting.showSuccessToast('SignUp Success');
        },
        error: (err, stackTrace) {
          context.loaderOverlay.hide();
          Toasting.showErrorToast(err.toString());
        },
        orElse: () => null,
      );
    });

    final mode = ref.watch(validateModeProvider('SignUp'));
    final passShow = ref.watch(passControllerProvider('SignUp'));
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SignUp Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FormBuilder(
              key: _formKey,
              autovalidateMode: mode,
              child: ListView(
                children: [

                  Gap(40),
                  FormBuilderTextField(
                    name: 'username',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Username',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  Gap(20),
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
                          ref.read(passControllerProvider('SignUp').notifier).change();
                        },
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(5),
                    ]),
                  ),
                  Gap(20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
                        final map = _formKey.currentState!.value;
                        ref.read(signUpControllerProvider.notifier).signUp(
                            username: map['username'],
                            email: map['email'],
                            password: map['password']
                        );

                      }else{
                        ref.read(validateModeProvider('SignUp').notifier).change();
                      }
                    },
                    child: Text('SignUp'),
                  ),
                  Gap(20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(onPressed: (){
                        context.pop();
                      }, child: Text('Login'),)
                    ],
                  )

                ],
              )
          ),
        ),
      ),
    );
  }
}
