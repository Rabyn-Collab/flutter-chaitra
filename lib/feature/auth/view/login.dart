import 'package:flutter/material.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('User Login'),
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
                    Text('Login Now !', style: Theme.of(context).textTheme.headlineSmall,)
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
                      onPressed: () {},
                      child: const Text('Login'),
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
