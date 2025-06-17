import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/auth/view/controllers/auth_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(signUpControllerProvider, (previous, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (data) {
            Fluttertoast.showToast(msg: 'SignUp Success');
            context.pop();
          },
          error: (err, st){
            Fluttertoast.showToast(msg: '$err');
          }

      );
    });
    final signUpController = ref.watch(signUpControllerProvider);
    return Scaffold(
      appBar: AppBar(
        // title: const Text('User SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const Gap(40),

            Row(
              children: [
                FlutterLogo(size: 100 ,),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Text('Welcome To Fast Shop', style: Theme.of(context).textTheme.headlineSmall),
                    Text('SignUp Now !', style: Theme.of(context).textTheme.headlineSmall,)
                  ],
                ),

              ],
            ),
            const Gap(40),

            FormBuilder(
              key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FormBuilderTextField(
                      name: 'username',
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    const Gap(20),

                    FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const Gap(20),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(5),
                        FormBuilderValidators.maxLength(20),
                      ]),
                      obscureText: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: signUpController.isLoading ? null : () {
                        FocusScope.of(context).unfocus();
                        if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
                         final map = _formKey.currentState!.value;
                          ref.read(signUpControllerProvider.notifier).userSignup(map);
                        }
                      },
                      child: signUpController.isLoading ? const CircularProgressIndicator() : const Text('SignUp'),
                    )
                  ],
                )
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Login'),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
