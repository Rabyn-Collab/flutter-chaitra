import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                      child: const Text('SignUp'),
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
