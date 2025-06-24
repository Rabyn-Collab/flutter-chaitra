import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';


class AddForm extends ConsumerStatefulWidget {
  const AddForm({super.key});

  @override
  ConsumerState createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: ListView(
              children: [
                // title, description, price, category, brand
                FormBuilderTextField(
                  name: 'title',
                  decoration: const InputDecoration(label: Text('Title')),
                ),
                const Gap(15),
                FormBuilderTextField(
                  name: 'description',
                  maxLines: 3,
                  decoration: const InputDecoration(label: Text('Description')),
                ),
                const Gap(15),
                FormBuilderTextField(
                  name: 'price',
                  decoration: const InputDecoration(label: Text('Price')),
                ),
                const Gap(15),
               FormBuilderDropdown(
                   hint: const Text('Category'),
                   name: 'category', items: [
                 DropdownMenuItem(value: 'electronics', child: Text('Electronics')),
                 DropdownMenuItem(value: 'jewelery', child: Text('Jewelery')),
                 DropdownMenuItem(value: 'men\'s clothing', child: Text('Men\'s Clothing')),
                 DropdownMenuItem(value: 'women\'s clothing', child: Text('Women\'s Clothing')),
               ] ),
                const Gap(15),
                 FormBuilderDropdown(
                     name: 'brand',
                     items: [
                       DropdownMenuItem(value: 'apple', child: Text('Apple')),
                       DropdownMenuItem(value: 'samsung', child: Text('Samsung')),
                       DropdownMenuItem(value: 'oppo', child: Text('Oppo')),
                       DropdownMenuItem(value: 'vivo', child: Text('Vivo')),
                     ]
                 )

              ],
            ),
          )
      ),
    );
  }
}
