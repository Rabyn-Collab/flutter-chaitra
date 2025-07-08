import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FormBuilder(
          child: ListView(
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(label: Text('Name')),
              ),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(label: Text('Email')),
              ),
              ElevatedButton(onPressed: (){}, child: const Text('Update'),)
            ],
          )
      ),
    );
  }
}
