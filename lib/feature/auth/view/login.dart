import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/auth/view/controllers/auth_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        data: (data) {
          Fluttertoast.showToast(msg: 'Login Success');
        },
        error: (err, st){
          Fluttertoast.showToast(msg: '$err');
        }

      );
    });
    final loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      appBar: AppBar(),
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
                    Text('Login Now !', style: Theme.of(context).textTheme.headlineSmall,)
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
                      name: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.email(),
                    ),
                    const Gap(20),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: FormBuilderValidators.required(),
                      obscureText: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: loginController.isLoading ? null : () {
                        FocusScope.of(context).unfocus();
                        if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
                           final map = _formKey.currentState!.value;
                           ref.read(loginControllerProvider.notifier).userLogin(map);
                        }
                      },
                      child: loginController.isLoading ? const CircularProgressIndicator() : const Text('Login'),
                    )
                  ],
                )
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
               Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    context.pushNamed(RouteEnum.signup.name);
                  },
                  child: const Text('Sign Up'),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
